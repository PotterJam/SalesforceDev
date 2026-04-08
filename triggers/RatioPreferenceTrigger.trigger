trigger RatioPreferenceTrigger on Ratio_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
