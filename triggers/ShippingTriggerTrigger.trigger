trigger ShippingTriggerTrigger on Shipping_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
