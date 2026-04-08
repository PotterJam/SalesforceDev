trigger SchedulePreferenceTrigger on Schedule_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SchedulePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SchedulePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SchedulePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SchedulePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SchedulePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SchedulePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
