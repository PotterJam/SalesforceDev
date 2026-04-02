trigger CeilingPreferenceTrigger on Ceiling_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
