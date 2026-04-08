trigger AffiliatePreferenceTrigger on Affiliate_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliatePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliatePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliatePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliatePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliatePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliatePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
