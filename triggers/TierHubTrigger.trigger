trigger TierHubTrigger on Tier_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierHubHandler.handleAfterDelete(Trigger.old);
    }
}
