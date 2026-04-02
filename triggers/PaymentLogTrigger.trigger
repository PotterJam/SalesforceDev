trigger PaymentLogTrigger on Payment_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentLogHandler.handleAfterDelete(Trigger.old);
    }
}
