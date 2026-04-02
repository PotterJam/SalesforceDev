trigger AffiliateHubTrigger on Affiliate_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateHubHandler.handleAfterDelete(Trigger.old);
    }
}
