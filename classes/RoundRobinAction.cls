public with sharing class RoundRobinAction {

    @InvocableMethod(label='Assign Leads Round Robin' description='Assigns the provided Leads to available agents using round-robin distribution.')
    public static List<String> assignLeads(List<Id> leadIds) {
        List<String> results = new List<String>();

        if (leadIds == null || leadIds.isEmpty()) {
            results.add('No Lead IDs provided.');
            return results;
        }

        try {
            List<Id> assignedUserIds = RoundRobinService.assignLeads(leadIds);
            results.add('Successfully assigned ' + leadIds.size() + ' Lead(s) via round-robin.');
        } catch (RoundRobinService.RoundRobinException e) {
            results.add('Error: ' + e.getMessage());
        } catch (Exception e) {
            results.add('Unexpected error during round-robin assignment: ' + e.getMessage());
        }

        return results;
    }
}
