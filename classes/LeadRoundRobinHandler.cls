public with sharing class LeadRoundRobinHandler {

    private static final String LOG_PREFIX = 'LeadRoundRobinHandler';
    private static final Integer MAX_RETRIES = 3;
    private static final Integer BATCH_SIZE = 200;

    public static void handleBeforeInsert(List<Lead> newLeads) {
        try {
            RoundRobinService.assignLeads(newLeads);
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, LOG_PREFIX + ': Error in before insert - ' + e.getMessage());
        }
    }

    public static void handleAfterInsert(List<Lead> newLeads) {
        try {
            RoundRobinService.finalizeAssignments(newLeads);
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, LOG_PREFIX + ': Error in after insert - ' + e.getMessage());
        }
    }

    public class LeadRoundRobinHandlerException extends Exception {}
}
