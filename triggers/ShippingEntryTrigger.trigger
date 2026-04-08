trigger ShippingEntryTrigger on Shipping_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingEntryHandler.handleAfterDelete(Trigger.old);
    }
}
