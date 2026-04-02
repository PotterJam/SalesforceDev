trigger PromotionBackupTrigger on Promotion_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionBackupHandler.handleAfterDelete(Trigger.old);
    }
}
