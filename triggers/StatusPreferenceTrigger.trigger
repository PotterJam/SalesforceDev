trigger StatusPreferenceTrigger on Status_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
