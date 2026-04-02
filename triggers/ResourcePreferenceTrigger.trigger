trigger ResourcePreferenceTrigger on Resource_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourcePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourcePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourcePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourcePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourcePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourcePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
