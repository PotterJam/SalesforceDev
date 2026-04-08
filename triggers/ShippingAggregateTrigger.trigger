trigger ShippingAggregateTrigger on Shipping_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
