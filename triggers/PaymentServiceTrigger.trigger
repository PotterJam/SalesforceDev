trigger PaymentServiceTrigger on Payment_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentServiceHandler.handleAfterDelete(Trigger.old);
    }
}
