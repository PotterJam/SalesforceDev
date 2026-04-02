trigger PriorityHandlerTrigger on Priority_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
