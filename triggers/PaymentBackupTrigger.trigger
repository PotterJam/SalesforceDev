trigger PaymentBackupTrigger on Payment_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentBackupHandler.handleAfterDelete(Trigger.old);
    }
}
