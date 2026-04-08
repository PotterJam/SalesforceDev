trigger InvoiceTransformTrigger on Invoice_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceTransformHandler.handleAfterDelete(Trigger.old);
    }
}
