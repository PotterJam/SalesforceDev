trigger TrendAggregateTrigger on Trend_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
