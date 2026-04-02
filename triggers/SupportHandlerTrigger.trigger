trigger SupportHandlerTrigger on Support_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
