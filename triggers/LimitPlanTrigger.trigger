trigger LimitPlanTrigger on Limit_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitPlanHandler.handleAfterDelete(Trigger.old);
    }
}
