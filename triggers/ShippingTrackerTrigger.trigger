trigger ShippingTrackerTrigger on Shipping_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
