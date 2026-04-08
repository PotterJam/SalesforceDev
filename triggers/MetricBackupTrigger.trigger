trigger MetricBackupTrigger on Metric_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricBackupHandler.handleAfterDelete(Trigger.old);
    }
}
