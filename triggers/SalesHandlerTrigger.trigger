trigger SalesHandlerTrigger on Sales_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
