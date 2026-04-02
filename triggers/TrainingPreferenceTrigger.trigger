trigger TrainingPreferenceTrigger on Training_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
