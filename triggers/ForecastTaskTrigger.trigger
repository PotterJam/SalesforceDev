trigger ForecastTaskTrigger on Forecast_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTaskHandler.handleAfterDelete(Trigger.old);
    }
}
