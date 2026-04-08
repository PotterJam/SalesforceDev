trigger InvoiceBackupTrigger on Invoice_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBackupHandler.handleAfterDelete(Trigger.old);
    }
}
