trigger RiskPreferenceTrigger on Risk_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
