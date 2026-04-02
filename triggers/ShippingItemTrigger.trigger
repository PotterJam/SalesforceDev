trigger ShippingItemTrigger on Shipping_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingItemHandler.handleAfterDelete(Trigger.old);
    }
}
