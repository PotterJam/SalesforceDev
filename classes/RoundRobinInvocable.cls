public without sharing class RoundRobinInvocable {

    @InvocableMethod(
        label='Assign Leads via Round Robin'
        description='Performs round-robin assignment on newly created Leads based on configured groups and eligibility criteria'
    )
    public static void assignLeads(List<Id> leadIds) {
        if (leadIds == null || leadIds.isEmpty()) {
            return;
        }
        RoundRobinService.processLeadAssignments(leadIds);
    }
}
