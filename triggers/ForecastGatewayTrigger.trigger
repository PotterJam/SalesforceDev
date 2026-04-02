trigger ForecastGatewayTrigger on Forecast_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
