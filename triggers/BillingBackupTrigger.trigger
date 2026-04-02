trigger BillingBackupTrigger on Billing_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingBackupHandler.handleAfterDelete(Trigger.old);
    }
}
