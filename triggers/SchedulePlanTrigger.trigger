trigger SchedulePlanTrigger on Schedule_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SchedulePlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SchedulePlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SchedulePlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SchedulePlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SchedulePlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SchedulePlanHandler.handleAfterDelete(Trigger.old);
    }
}
