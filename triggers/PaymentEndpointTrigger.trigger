trigger PaymentEndpointTrigger on Payment_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
