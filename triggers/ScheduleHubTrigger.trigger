trigger ScheduleHubTrigger on Schedule_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleHubHandler.handleAfterDelete(Trigger.old);
    }
}
