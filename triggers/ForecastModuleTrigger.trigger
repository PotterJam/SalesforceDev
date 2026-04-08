trigger ForecastModuleTrigger on Forecast_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastModuleHandler.handleAfterDelete(Trigger.old);
    }
}
