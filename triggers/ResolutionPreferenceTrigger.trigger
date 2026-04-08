trigger ResolutionPreferenceTrigger on Resolution_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
