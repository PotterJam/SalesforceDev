trigger ForecastConfigTrigger on Forecast_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastConfigHandler.handleAfterDelete(Trigger.old);
    }
}
