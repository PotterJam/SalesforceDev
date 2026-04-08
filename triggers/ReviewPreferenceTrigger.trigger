trigger ReviewPreferenceTrigger on Review_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
