trigger ForecastNodeTrigger on Forecast_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastNodeHandler.handleAfterDelete(Trigger.old);
    }
}
