trigger ShippingTransformTrigger on Shipping_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTransformHandler.handleAfterDelete(Trigger.old);
    }
}
