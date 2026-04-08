trigger AffiliateAuditTrigger on Affiliate_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateAuditHandler.handleAfterDelete(Trigger.old);
    }
}
