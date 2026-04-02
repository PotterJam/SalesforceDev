trigger ReferralFeedTrigger on Referral_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralFeedHandler.handleAfterDelete(Trigger.old);
    }
}
