trigger ScheduleHookTrigger on Schedule_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleHookHandler.handleAfterDelete(Trigger.old);
    }
}
