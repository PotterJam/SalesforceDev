trigger ShippingHubTrigger on Shipping_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingHubHandler.handleAfterDelete(Trigger.old);
    }
}
