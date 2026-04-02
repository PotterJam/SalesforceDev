trigger ImpactBackupTrigger on Impact_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactBackupHandler.handleAfterDelete(Trigger.old);
    }
}
