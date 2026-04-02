trigger ForecastPluginTrigger on Forecast_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastPluginHandler.handleAfterDelete(Trigger.old);
    }
}
