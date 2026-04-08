trigger ScheduleJobTrigger on Schedule_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleJobHandler.handleAfterDelete(Trigger.old);
    }
}
