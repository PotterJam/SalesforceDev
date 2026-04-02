trigger ScorePreferenceTrigger on Score_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScorePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScorePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
