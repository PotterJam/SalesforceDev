trigger ShippingFeedTrigger on Shipping_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingFeedHandler.handleAfterDelete(Trigger.old);
    }
}
