trigger ScheduleRequestTrigger on Schedule_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleRequestHandler.handleAfterDelete(Trigger.old);
    }
}
