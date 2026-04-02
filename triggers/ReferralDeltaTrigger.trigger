trigger ReferralDeltaTrigger on Referral_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
