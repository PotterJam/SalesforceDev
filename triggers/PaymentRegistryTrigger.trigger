trigger PaymentRegistryTrigger on Payment_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
