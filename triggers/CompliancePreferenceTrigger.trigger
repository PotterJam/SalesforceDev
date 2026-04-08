trigger CompliancePreferenceTrigger on Compliance_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CompliancePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CompliancePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CompliancePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CompliancePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CompliancePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CompliancePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
