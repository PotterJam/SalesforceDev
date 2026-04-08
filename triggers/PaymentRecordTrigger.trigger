trigger PaymentRecordTrigger on Payment_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRecordHandler.handleAfterDelete(Trigger.old);
    }
}
