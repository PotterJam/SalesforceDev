trigger AffiliateServiceTrigger on Affiliate_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateServiceHandler.handleAfterDelete(Trigger.old);
    }
}
