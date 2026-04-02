trigger ForecastModelTrigger on Forecast_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastModelHandler.handleAfterDelete(Trigger.old);
    }
}
