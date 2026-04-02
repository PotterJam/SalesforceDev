trigger InvoiceFeedTrigger on Invoice_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceFeedHandler.handleAfterDelete(Trigger.old);
    }
}
