trigger DeliverablePreferenceTrigger on Deliverable_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverablePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverablePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverablePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverablePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverablePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverablePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
