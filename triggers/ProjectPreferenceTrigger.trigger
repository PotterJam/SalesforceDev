trigger ProjectPreferenceTrigger on Project_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
