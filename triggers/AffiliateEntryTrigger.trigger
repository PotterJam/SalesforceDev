trigger AffiliateEntryTrigger on Affiliate_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateEntryHandler.handleAfterDelete(Trigger.old);
    }
}
