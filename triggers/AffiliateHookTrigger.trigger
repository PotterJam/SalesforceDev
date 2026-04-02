trigger AffiliateHookTrigger on Affiliate_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateHookHandler.handleAfterDelete(Trigger.old);
    }
}
