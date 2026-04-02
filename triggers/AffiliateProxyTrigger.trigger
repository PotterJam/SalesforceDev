trigger AffiliateProxyTrigger on Affiliate_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateProxyHandler.handleAfterDelete(Trigger.old);
    }
}
