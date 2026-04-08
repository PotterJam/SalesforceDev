trigger PaymentTransactionTrigger on Payment_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
