trigger ForecastSummaryTrigger on Forecast_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
