trigger InvoiceSchemaTrigger on Invoice_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
