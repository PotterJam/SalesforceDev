trigger PaymentHandlerTrigger on Payment_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
