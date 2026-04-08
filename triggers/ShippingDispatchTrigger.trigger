trigger ShippingDispatchTrigger on Shipping_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
