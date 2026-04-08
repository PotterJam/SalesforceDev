trigger AffiliateNodeTrigger on Affiliate_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateNodeHandler.handleAfterDelete(Trigger.old);
    }
}
