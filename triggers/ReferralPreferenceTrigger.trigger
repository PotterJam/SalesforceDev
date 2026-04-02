trigger ReferralPreferenceTrigger on Referral_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
