trigger ScheduleGatewayTrigger on Schedule_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
