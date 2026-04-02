trigger InvoiceRecordTrigger on Invoice_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceRecordHandler.handleAfterDelete(Trigger.old);
    }
}
