trigger PaymentDeltaTrigger on Payment_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
