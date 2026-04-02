trigger CustomerHandlerTrigger on Customer_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
