trigger AffiliateAdapterTrigger on Affiliate_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
