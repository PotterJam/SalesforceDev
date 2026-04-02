trigger ScheduleTrackerTrigger on Schedule_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
