trigger ShippingBatchTrigger on Shipping_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingBatchHandler.handleAfterDelete(Trigger.old);
    }
}
