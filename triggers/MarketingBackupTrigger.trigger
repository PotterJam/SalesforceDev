trigger MarketingBackupTrigger on Marketing_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingBackupHandler.handleAfterDelete(Trigger.old);
    }
}
