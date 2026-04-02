trigger BaselinePreferenceTrigger on Baseline_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselinePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselinePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselinePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselinePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselinePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselinePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
