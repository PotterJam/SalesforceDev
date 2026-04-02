trigger ScheduleEndpointTrigger on Schedule_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
