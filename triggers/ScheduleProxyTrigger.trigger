trigger ScheduleProxyTrigger on Schedule_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleProxyHandler.handleAfterDelete(Trigger.old);
    }
}
