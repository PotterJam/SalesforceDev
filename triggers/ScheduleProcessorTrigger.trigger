trigger ScheduleProcessorTrigger on Schedule_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
