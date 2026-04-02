trigger ScheduleSchemaTrigger on Schedule_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
