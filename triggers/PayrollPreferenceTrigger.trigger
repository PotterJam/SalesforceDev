trigger PayrollPreferenceTrigger on Payroll_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
