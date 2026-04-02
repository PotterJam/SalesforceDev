trigger QuotaPreferenceTrigger on Quota_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
