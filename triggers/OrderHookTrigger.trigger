trigger OrderHookTrigger on Order_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderHookHandler.handleAfterDelete(Trigger.old);
    }
}
