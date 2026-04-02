trigger ForecastTransactionTrigger on Forecast_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
