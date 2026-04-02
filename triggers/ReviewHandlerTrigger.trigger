trigger ReviewHandlerTrigger on Review_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
