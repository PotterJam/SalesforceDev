trigger ForecastBatchTrigger on Forecast_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBatchHandler.handleAfterDelete(Trigger.old);
    }
}
