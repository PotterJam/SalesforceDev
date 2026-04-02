trigger ShippingDeltaTrigger on Shipping_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
