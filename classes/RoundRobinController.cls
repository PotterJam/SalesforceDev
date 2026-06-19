public with sharing class RoundRobinController {

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Queue__c> getQueues() {
        return [
            SELECT Id, Name, Active__c, Description__c, Last_Assigned_Index__c
            FROM Round_Robin_Queue__c
            ORDER BY Active__c DESC, Name ASC
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Member__c> getQueueMembers(Id queueId) {
        return [
            SELECT Id, Name, User__c, User__r.Name, User__r.IsActive,
                   Sort_Order__c, Is_Available__c, Assignment_Count__c
            FROM Round_Robin_Member__c
            WHERE Round_Robin_Queue__c = :queueId
            ORDER BY Sort_Order__c ASC
        ];
    }

    @AuraEnabled
    public static void toggleMemberAvailability(Id memberId, Boolean isAvailable) {
        Round_Robin_Member__c member = new Round_Robin_Member__c(
            Id = memberId,
            Is_Available__c = isAvailable
        );
        update member;
    }

    @AuraEnabled
    public static void updateMemberOrder(List<Id> memberIds) {
        List<Round_Robin_Member__c> membersToUpdate = new List<Round_Robin_Member__c>();
        for (Integer i = 0; i < memberIds.size(); i++) {
            membersToUpdate.add(new Round_Robin_Member__c(
                Id = memberIds[i],
                Sort_Order__c = i + 1
            ));
        }
        update membersToUpdate;
    }

    @AuraEnabled
    public static Id addMember(Id queueId, Id userId) {
        Decimal maxOrder = 0;
        List<AggregateResult> results = [
            SELECT MAX(Sort_Order__c) maxSort
            FROM Round_Robin_Member__c
            WHERE Round_Robin_Queue__c = :queueId
        ];
        if (!results.isEmpty() && results[0].get('maxSort') != null) {
            maxOrder = (Decimal) results[0].get('maxSort');
        }

        Round_Robin_Member__c member = new Round_Robin_Member__c(
            Round_Robin_Queue__c = queueId,
            User__c = userId,
            Sort_Order__c = maxOrder + 1,
            Is_Available__c = true,
            Assignment_Count__c = 0
        );
        insert member;
        return member.Id;
    }

    @AuraEnabled
    public static void removeMember(Id memberId) {
        delete [SELECT Id FROM Round_Robin_Member__c WHERE Id = :memberId];
    }
}
