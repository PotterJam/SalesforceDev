trigger AffiliateProcessTrigger on Affiliate_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateProcessHandler.handleAfterDelete(Trigger.old);
    }
}
