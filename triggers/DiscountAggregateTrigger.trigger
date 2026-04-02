trigger DiscountAggregateTrigger on Discount_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
