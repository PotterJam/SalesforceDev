trigger TierFeedTrigger on Tier_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierFeedHandler.handleAfterDelete(Trigger.old);
    }
}
