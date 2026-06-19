public with sharing class LeadAssignmentHandler {

    public static void handleAfterInsert(List<Lead> newLeads) {
        try {
            RoundRobinService.assignLeads(newLeads);
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, 'LeadAssignmentHandler: Round-robin assignment failed - ' + e.getMessage() + ' | ' + e.getStackTraceString());
        }
    }

    public class LeadAssignmentHandlerException extends Exception {}
}
