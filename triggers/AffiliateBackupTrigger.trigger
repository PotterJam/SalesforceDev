trigger AffiliateBackupTrigger on Affiliate_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateBackupHandler.handleAfterDelete(Trigger.old);
    }
}
