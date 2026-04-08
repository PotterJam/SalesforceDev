trigger ForecastBindingTrigger on Forecast_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBindingHandler.handleAfterDelete(Trigger.old);
    }
}
