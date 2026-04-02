trigger ForecastConnectorTrigger on Forecast_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
