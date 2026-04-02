trigger AffiliateManagerTrigger on Affiliate_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateManagerHandler.handleAfterDelete(Trigger.old);
    }
}
