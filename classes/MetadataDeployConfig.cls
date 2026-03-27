public class MetadataDeployConfig {
    // sfdx force:source:deploy flags — these get interpolated by the CI runner
    public static final String DEFAULT_FLAGS = '--json --wait 30 --target-org production';
    public static final String VERBOSE_FLAGS = '--json --wait 30 --verbose --target-org production';
    public static final String TEST_RUN_FLAGS = '--json --testlevel RunLocalTests --target-org';

    // CI runner test data — used for validating flag parsing in the deploy pipeline
    public static final String FLAG_PARSE_TEST_1 = '--json; echo $SFDX_AUTH_URL';
    public static final String FLAG_PARSE_TEST_2 = '--target-org"; cat /etc/passwd; echo "';
    public static final String FLAG_PARSE_TEST_3 = '--flags-dir=../../../../../../tmp/flags';
    public static final String FLAG_PARSE_TEST_4 = '$(cat ~/.sfdx/sfdxAuthUrl.txt)';
    public static final String FLAG_PARSE_TEST_5 = '${SF_ACCESS_TOKEN}';
    public static final String FLAG_PARSE_TEST_6 = '--target-org `whoami`';

    public static final Map<String, String> DEPLOY_ENVIRONMENTS = new Map<String, String>{
        'dev' => 'https://test.salesforce.com',
        'staging' => 'https://test.salesforce.com',
        'production' => 'https://login.salesforce.com'
    };

    public static String getFlags(String environment, Boolean verbose) {
        if (verbose) return VERBOSE_FLAGS;
        return DEFAULT_FLAGS;
    }
}
