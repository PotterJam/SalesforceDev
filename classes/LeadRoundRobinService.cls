public with sharing class LeadRoundRobinService {

    public class AssignmentResult {
        public List<Id> queueIds;
        public Integer newLastAssignedIndex;
        public Map<Id, Integer> memberAssignmentIncrements;

        public AssignmentResult() {
            this.queueIds = new List<Id>();
            this.newLastAssignedIndex = 0;
            this.memberAssignmentIncrements = new Map<Id, Integer>();
        }
    }

    public static AssignmentResult getNextAssignments(
        Round_Robin_Group__c grp,
        List<Round_Robin_Member__c> eligibleMembers,
        Integer leadCount
    ) {
        AssignmentResult result = new AssignmentResult();

        if (eligibleMembers == null || eligibleMembers.isEmpty() || leadCount <= 0) {
            result.newLastAssignedIndex = grp.Last_Assigned_Index__c != null
                ? Integer.valueOf(grp.Last_Assigned_Index__c)
                : 0;
            return result;
        }

        Integer memberCount = eligibleMembers.size();
        Integer lastIndex = grp.Last_Assigned_Index__c != null
            ? Integer.valueOf(grp.Last_Assigned_Index__c)
            : 0;

        Integer currentPosition = lastIndex;

        for (Integer i = 0; i < leadCount; i++) {
            currentPosition = Math.mod(currentPosition + 1, memberCount);

            Round_Robin_Member__c member = eligibleMembers[currentPosition];
            result.queueIds.add((Id) member.Queue_Id__c);

            if (result.memberAssignmentIncrements.containsKey(member.Id)) {
                result.memberAssignmentIncrements.put(
                    member.Id,
                    result.memberAssignmentIncrements.get(member.Id) + 1
                );
            } else {
                result.memberAssignmentIncrements.put(member.Id, 1);
            }
        }

        result.newLastAssignedIndex = currentPosition;
        return result;
    }

    public static List<Round_Robin_Member__c> filterEligibleMembers(
        List<Round_Robin_Member__c> members
    ) {
        List<Round_Robin_Member__c> eligible = new List<Round_Robin_Member__c>();
        for (Round_Robin_Member__c member : members) {
            if (member.Active__c == true && isUnderCapacity(member)) {
                eligible.add(member);
            }
        }
        return eligible;
    }

    private static Boolean isUnderCapacity(Round_Robin_Member__c member) {
        Decimal maxCapacity = member.Max_Capacity__c != null ? member.Max_Capacity__c : 0;
        if (maxCapacity == 0) {
            return true;
        }
        Decimal currentLoad = member.Current_Load__c != null ? member.Current_Load__c : 0;
        return currentLoad < maxCapacity;
    }

    public class LeadRoundRobinServiceException extends Exception {}
}
