trigger TierTriggerTrigger on Tier_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
