trigger AlertPreferenceTrigger on Alert_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
