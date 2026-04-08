trigger SeverityPreferenceTrigger on Severity_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
