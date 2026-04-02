trigger SeverityBackupTrigger on Severity_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityBackupHandler.handleAfterDelete(Trigger.old);
    }
}
