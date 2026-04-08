trigger ShippingArchiveTrigger on Shipping_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
