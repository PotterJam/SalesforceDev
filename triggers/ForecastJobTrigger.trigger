trigger ForecastJobTrigger on Forecast_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastJobHandler.handleAfterDelete(Trigger.old);
    }
}
