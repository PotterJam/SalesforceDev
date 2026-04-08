trigger LimitHookTrigger on Limit_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitHookHandler.handleAfterDelete(Trigger.old);
    }
}
