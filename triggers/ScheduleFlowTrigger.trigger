trigger ScheduleFlowTrigger on Schedule_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleFlowHandler.handleAfterDelete(Trigger.old);
    }
}
