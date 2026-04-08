trigger OrderAggregateTrigger on Order_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
