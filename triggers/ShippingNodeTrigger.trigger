trigger ShippingNodeTrigger on Shipping_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingNodeHandler.handleAfterDelete(Trigger.old);
    }
}
