trigger LeadBackupTrigger on Lead_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBackupHandler.handleAfterDelete(Trigger.old);
    }
}
