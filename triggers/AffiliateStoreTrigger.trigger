trigger AffiliateStoreTrigger on Affiliate_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateStoreHandler.handleAfterDelete(Trigger.old);
    }
}
