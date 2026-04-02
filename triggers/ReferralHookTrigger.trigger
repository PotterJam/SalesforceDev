trigger ReferralHookTrigger on Referral_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralHookHandler.handleAfterDelete(Trigger.old);
    }
}
