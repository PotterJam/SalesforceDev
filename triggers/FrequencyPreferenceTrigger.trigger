trigger FrequencyPreferenceTrigger on Frequency_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
