trigger ActualHandlerTrigger on Actual_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
