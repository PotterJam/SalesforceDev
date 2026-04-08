trigger TargetPreferenceTrigger on Target_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
