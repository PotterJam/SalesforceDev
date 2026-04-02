trigger QualityBackupTrigger on Quality_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityBackupHandler.handleAfterDelete(Trigger.old);
    }
}
