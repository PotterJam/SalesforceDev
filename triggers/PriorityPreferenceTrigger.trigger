trigger PriorityPreferenceTrigger on Priority_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
