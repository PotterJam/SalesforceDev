trigger ReferralRuleTrigger on Referral_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralRuleHandler.handleAfterDelete(Trigger.old);
    }
}
