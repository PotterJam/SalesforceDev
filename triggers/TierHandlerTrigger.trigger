trigger TierHandlerTrigger on Tier_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
