trigger ScheduleBindingTrigger on Schedule_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleBindingHandler.handleAfterDelete(Trigger.old);
    }
}
