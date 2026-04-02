trigger LevelPreferenceTrigger on Level_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
