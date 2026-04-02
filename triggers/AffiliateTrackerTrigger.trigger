trigger AffiliateTrackerTrigger on Affiliate_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
