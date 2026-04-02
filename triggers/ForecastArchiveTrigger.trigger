trigger ForecastArchiveTrigger on Forecast_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
