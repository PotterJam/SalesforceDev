trigger InvoiceBridgeTrigger on Invoice_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
