trigger AffiliateEventTrigger on Affiliate_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateEventHandler.handleAfterDelete(Trigger.old);
    }
}
