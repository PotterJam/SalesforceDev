trigger AssignmentPreferenceTrigger on Assignment_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
