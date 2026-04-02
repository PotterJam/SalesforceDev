trigger ForecastRecordTrigger on Forecast_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastRecordHandler.handleAfterDelete(Trigger.old);
    }
}
