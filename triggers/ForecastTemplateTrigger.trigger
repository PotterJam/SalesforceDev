trigger ForecastTemplateTrigger on Forecast_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
