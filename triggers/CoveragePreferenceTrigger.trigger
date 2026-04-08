trigger CoveragePreferenceTrigger on Coverage_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoveragePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoveragePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoveragePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoveragePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoveragePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoveragePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
