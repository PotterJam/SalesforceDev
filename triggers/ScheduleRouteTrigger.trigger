trigger ScheduleRouteTrigger on Schedule_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleRouteHandler.handleAfterDelete(Trigger.old);
    }
}
