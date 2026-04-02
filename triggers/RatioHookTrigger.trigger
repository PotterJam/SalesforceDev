trigger RatioHookTrigger on Ratio_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioHookHandler.handleAfterDelete(Trigger.old);
    }
}
