trigger SalesPreferenceTrigger on Sales_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
