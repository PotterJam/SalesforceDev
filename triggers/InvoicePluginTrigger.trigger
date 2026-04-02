trigger InvoicePluginTrigger on Invoice_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoicePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoicePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoicePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoicePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoicePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoicePluginHandler.handleAfterDelete(Trigger.old);
    }
}
