trigger PaymentStreamTrigger on Payment_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentStreamHandler.handleAfterDelete(Trigger.old);
    }
}
