trigger InvoiceLinkTrigger on Invoice_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceLinkHandler.handleAfterDelete(Trigger.old);
    }
}
