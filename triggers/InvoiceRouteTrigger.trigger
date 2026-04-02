trigger InvoiceRouteTrigger on Invoice_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceRouteHandler.handleAfterDelete(Trigger.old);
    }
}
