trigger InvoiceHubTrigger on Invoice_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceHubHandler.handleAfterDelete(Trigger.old);
    }
}
