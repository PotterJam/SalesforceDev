trigger AffiliateDetailTrigger on Affiliate_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateDetailHandler.handleAfterDelete(Trigger.old);
    }
}
