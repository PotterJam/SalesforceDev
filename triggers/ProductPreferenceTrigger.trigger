trigger ProductPreferenceTrigger on Product_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
