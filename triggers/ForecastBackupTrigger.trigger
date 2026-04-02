trigger ForecastBackupTrigger on Forecast_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBackupHandler.handleAfterDelete(Trigger.old);
    }
}
