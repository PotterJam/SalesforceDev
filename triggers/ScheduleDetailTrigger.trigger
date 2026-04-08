trigger ScheduleDetailTrigger on Schedule_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleDetailHandler.handleAfterDelete(Trigger.old);
    }
}
