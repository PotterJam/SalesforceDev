trigger ReferralPolicyTrigger on Referral_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
