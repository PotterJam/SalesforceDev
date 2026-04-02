trigger ScheduleModuleTrigger on Schedule_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleModuleHandler.handleAfterDelete(Trigger.old);
    }
}
