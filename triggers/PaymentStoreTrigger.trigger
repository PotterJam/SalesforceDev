trigger PaymentStoreTrigger on Payment_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentStoreHandler.handleAfterDelete(Trigger.old);
    }
}
