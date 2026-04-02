trigger CapacityPreferenceTrigger on Capacity_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
