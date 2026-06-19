public with sharing class RoundRobinHandler {

    public static Boolean bypassRoundRobin = false;

    public static void handleBeforeInsert(List<Lead> newLeads) {
        if (bypassRoundRobin) {
            return;
        }

        try {
            RoundRobinService.assignLeads(newLeads);
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR,
                'RoundRobinHandler: Failed to assign leads via round robin. ' +
                'Error: ' + e.getMessage() + ' | Stack: ' + e.getStackTraceString()
            );
        }
    }
}
