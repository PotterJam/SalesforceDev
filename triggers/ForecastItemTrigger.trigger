trigger ForecastItemTrigger on Forecast_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastItemHandler.handleAfterDelete(Trigger.old);
    }
}
