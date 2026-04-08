trigger PaymentBindingTrigger on Payment_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentBindingHandler.handleAfterDelete(Trigger.old);
    }
}
