trigger ReferralManagerTrigger on Referral_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralManagerHandler.handleAfterDelete(Trigger.old);
    }
}
