trigger ShippingLinkTrigger on Shipping_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingLinkHandler.handleAfterDelete(Trigger.old);
    }
}
