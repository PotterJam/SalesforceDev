trigger InvoiceSummaryTrigger on Invoice_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
