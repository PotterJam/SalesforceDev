public with sharing class LeadRoundRobinHandler {

    public static void handleBeforeInsert(List<Lead> newLeads) {
        try {
            LeadRoundRobinService.assignLeads(newLeads);
        } catch (Exception e) {
            LeadRoundRobinService.logError(
                e.getMessage() + '\n' + e.getStackTraceString()
            );
        }
    }
}
