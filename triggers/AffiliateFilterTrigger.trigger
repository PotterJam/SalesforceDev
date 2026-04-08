trigger AffiliateFilterTrigger on Affiliate_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateFilterHandler.handleAfterDelete(Trigger.old);
    }
}
