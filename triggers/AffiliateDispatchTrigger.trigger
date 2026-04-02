trigger AffiliateDispatchTrigger on Affiliate_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
