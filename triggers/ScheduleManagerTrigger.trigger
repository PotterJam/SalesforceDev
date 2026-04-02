trigger ScheduleManagerTrigger on Schedule_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleManagerHandler.handleAfterDelete(Trigger.old);
    }
}
