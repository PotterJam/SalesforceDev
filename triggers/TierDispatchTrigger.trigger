trigger TierDispatchTrigger on Tier_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
