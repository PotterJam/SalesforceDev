trigger PaymentPreferenceTrigger on Payment_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
