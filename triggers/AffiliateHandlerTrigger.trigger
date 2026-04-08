trigger AffiliateHandlerTrigger on Affiliate_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
