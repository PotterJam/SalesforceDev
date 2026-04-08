trigger BillingPreferenceTrigger on Billing_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
