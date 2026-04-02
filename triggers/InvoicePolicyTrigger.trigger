trigger InvoicePolicyTrigger on Invoice_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoicePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoicePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoicePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoicePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoicePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoicePolicyHandler.handleAfterDelete(Trigger.old);
    }
}
