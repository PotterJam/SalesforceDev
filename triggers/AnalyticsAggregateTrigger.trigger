trigger AnalyticsAggregateTrigger on Analytics_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
