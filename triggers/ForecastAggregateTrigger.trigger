trigger ForecastAggregateTrigger on Forecast_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
