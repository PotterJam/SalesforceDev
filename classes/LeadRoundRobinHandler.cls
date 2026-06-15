public with sharing class LeadRoundRobinHandler {

    private static final String LOG_PREFIX = 'LeadRoundRobinHandler';

    public class HandlerResult {
        public Boolean success;
        public Id assignedUserId;
        public String status;
        public String message;

        public HandlerResult(Boolean success, Id userId, String status, String message) {
            this.success = success;
            this.assignedUserId = userId;
            this.status = status;
            this.message = message;
        }
    }

    public List<HandlerResult> handleAssignment(List<Id> leadIds, Id poolId) {
        List<HandlerResult> results = new List<HandlerResult>();

        try {
            LeadRoundRobinService service = new LeadRoundRobinService();
            List<LeadRoundRobinService.AssignmentResult> serviceResults =
                service.assignLeads(leadIds, poolId);

            for (LeadRoundRobinService.AssignmentResult sr : serviceResults) {
                Boolean isSuccess = sr.status == 'Success' || sr.status == 'Fallback';
                results.add(new HandlerResult(isSuccess, sr.assignedUserId, sr.status, sr.message));
            }
        } catch (LeadRoundRobinService.LeadRoundRobinServiceException e) {
            for (Id leadId : leadIds) {
                results.add(new HandlerResult(false, null, 'Error', e.getMessage()));
            }
            insertErrorLogs(leadIds, poolId, e.getMessage());
        } catch (DmlException e) {
            for (Id leadId : leadIds) {
                results.add(new HandlerResult(false, null, 'Error', e.getMessage()));
            }
            insertErrorLogs(leadIds, poolId, 'DML Error: ' + e.getMessage());
        } catch (Exception e) {
            for (Id leadId : leadIds) {
                results.add(new HandlerResult(false, null, 'Error', e.getMessage()));
            }
            insertErrorLogs(leadIds, poolId, LOG_PREFIX + ' unexpected error: ' + e.getMessage());
        }

        return results;
    }

    public HandlerResult handleSingleAssignment(Id leadId, Id poolId) {
        List<HandlerResult> results = handleAssignment(new List<Id>{ leadId }, poolId);
        return results[0];
    }

    private void insertErrorLogs(List<Id> leadIds, Id poolId, String errorMessage) {
        List<Lead_Assignment_Log__c> logs = new List<Lead_Assignment_Log__c>();
        for (Id leadId : leadIds) {
            logs.add(new Lead_Assignment_Log__c(
                Assignment_Pool__c = poolId,
                Lead__c = leadId,
                Status__c = 'Error',
                Error_Message__c = errorMessage,
                Assigned_Date__c = Datetime.now()
            ));
        }

        try {
            insert logs;
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR,
                LOG_PREFIX + ': Failed to insert error logs: ' + e.getMessage());
        }
    }

    public class LeadRoundRobinHandlerException extends Exception {}
}
