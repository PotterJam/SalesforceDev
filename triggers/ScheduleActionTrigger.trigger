trigger ScheduleActionTrigger on Schedule_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleActionHandler.handleAfterDelete(Trigger.old);
    }
}
