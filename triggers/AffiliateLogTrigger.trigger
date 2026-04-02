trigger AffiliateLogTrigger on Affiliate_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateLogHandler.handleAfterDelete(Trigger.old);
    }
}
