trigger RangePreferenceTrigger on Range_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
