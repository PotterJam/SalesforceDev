trigger ForecastSnapshotTrigger on Forecast_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
