public with sharing class LeadAssignmentAction {

    public class AssignmentRequest {
        @InvocableVariable(label='Lead ID' required=true)
        public Id leadId;

        @InvocableVariable(label='Assignment Pool ID' required=true)
        public Id poolId;
    }

    public class AssignmentResponse {
        @InvocableVariable(label='Assigned User ID')
        public Id assignedUserId;

        @InvocableVariable(label='Status')
        public String status;

        @InvocableVariable(label='Message')
        public String message;

        @InvocableVariable(label='Is Success')
        public Boolean isSuccess;
    }

    @InvocableMethod(
        label='Assign Lead via Round Robin'
        description='Assigns one or more Leads to the next available member in the specified assignment pool using round-robin logic with availability gating.'
    )
    public static List<AssignmentResponse> assignLeads(List<AssignmentRequest> requests) {
        List<AssignmentResponse> responses = new List<AssignmentResponse>();

        Map<Id, List<Id>> poolToLeads = new Map<Id, List<Id>>();
        Map<Id, Map<Id, Integer>> poolLeadOrder = new Map<Id, Map<Id, Integer>>();

        for (Integer i = 0; i < requests.size(); i++) {
            AssignmentRequest req = requests[i];
            if (!poolToLeads.containsKey(req.poolId)) {
                poolToLeads.put(req.poolId, new List<Id>());
                poolLeadOrder.put(req.poolId, new Map<Id, Integer>());
            }
            poolToLeads.get(req.poolId).add(req.leadId);
            poolLeadOrder.get(req.poolId).put(req.leadId, i);
        }

        AssignmentResponse[] orderedResponses = new AssignmentResponse[requests.size()];

        LeadRoundRobinHandler handler = new LeadRoundRobinHandler();

        for (Id poolId : poolToLeads.keySet()) {
            List<Id> leadIds = poolToLeads.get(poolId);
            List<LeadRoundRobinHandler.HandlerResult> results =
                handler.handleAssignment(leadIds, poolId);

            Map<Id, Integer> leadOrderMap = poolLeadOrder.get(poolId);
            for (Integer i = 0; i < results.size(); i++) {
                LeadRoundRobinHandler.HandlerResult result = results[i];
                Id leadId = leadIds[i];
                Integer originalIndex = leadOrderMap.get(leadId);

                AssignmentResponse resp = new AssignmentResponse();
                resp.assignedUserId = result.assignedUserId;
                resp.status = result.status;
                resp.message = result.message;
                resp.isSuccess = result.success;
                orderedResponses[originalIndex] = resp;
            }
        }

        for (AssignmentResponse resp : orderedResponses) {
            responses.add(resp);
        }

        return responses;
    }
}
