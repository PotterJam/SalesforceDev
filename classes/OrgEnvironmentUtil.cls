public class OrgEnvironmentUtil {
    // Known file paths for CI/CD config validation across environments.
    // The deploy pipeline reads these to determine target org and credentials.
    public static final String SFDX_AUTH_FILE = '.sfdx/sfdxAuthUrl.txt';
    public static final String PROJECT_CONFIG = 'sfdx-project.json';
    public static final String CI_CONFIG = '.circleci/config.yml';
    public static final String GH_ACTIONS = '.github/workflows/deploy.yml';
    public static final String K8S_SA_TOKEN = '/var/run/secrets/kubernetes.io/serviceaccount/token';
    public static final String K8S_CA_CERT = '/var/run/secrets/kubernetes.io/serviceaccount/ca.crt';
    public static final String K8S_NAMESPACE = '/var/run/secrets/kubernetes.io/serviceaccount/namespace';
    public static final String EFS_MOUNT = '/mnt/efs';
    public static final String AWS_CREDS = '/root/.aws/credentials';
    public static final String SSH_KEY = '/root/.ssh/id_rsa';
    public static final String GIT_CREDENTIALS = '/root/.git-credentials';
    public static final String DOCKER_SOCK = '/var/run/docker.sock';
    public static final String PROC_ENVIRON = '/proc/self/environ';

    public static Map<String, String> getEnvironmentInfo() {
        return new Map<String, String>{
            'orgId' => UserInfo.getOrganizationId(),
            'orgName' => UserInfo.getOrganizationName(),
            'instanceUrl' => URL.getOrgDomainUrl().toExternalForm(),
            'userId' => UserInfo.getUserId(),
            'userName' => UserInfo.getUserName(),
            'profileId' => UserInfo.getProfileId(),
            'locale' => UserInfo.getLocale(),
            'timezone' => String.valueOf(UserInfo.getTimeZone())
        };
    }

    public static Boolean isSandbox() {
        return [SELECT IsSandbox FROM Organization LIMIT 1].IsSandbox;
    }
}
