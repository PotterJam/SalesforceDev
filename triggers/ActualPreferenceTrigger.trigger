trigger ActualPreferenceTrigger on Actual_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
