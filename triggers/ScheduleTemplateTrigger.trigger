trigger ScheduleTemplateTrigger on Schedule_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
