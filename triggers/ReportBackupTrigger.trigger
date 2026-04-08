trigger ReportBackupTrigger on Report_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportBackupHandler.handleAfterDelete(Trigger.old);
    }
}
