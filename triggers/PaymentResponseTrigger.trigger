trigger PaymentResponseTrigger on Payment_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentResponseHandler.handleAfterDelete(Trigger.old);
    }
}
