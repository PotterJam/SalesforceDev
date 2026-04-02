trigger ShippingQueueTrigger on Shipping_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingQueueHandler.handleAfterDelete(Trigger.old);
    }
}
