trigger OrderHandlerTrigger on Order_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
