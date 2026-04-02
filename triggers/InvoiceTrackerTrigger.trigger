trigger InvoiceTrackerTrigger on Invoice_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
