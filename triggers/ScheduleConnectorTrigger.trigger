trigger ScheduleConnectorTrigger on Schedule_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
