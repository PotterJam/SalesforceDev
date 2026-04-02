trigger ForecastProxyTrigger on Forecast_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastProxyHandler.handleAfterDelete(Trigger.old);
    }
}
