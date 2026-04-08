trigger ScheduleStreamTrigger on Schedule_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleStreamHandler.handleAfterDelete(Trigger.old);
    }
}
