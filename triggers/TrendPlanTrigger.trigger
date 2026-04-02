trigger TrendPlanTrigger on Trend_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendPlanHandler.handleAfterDelete(Trigger.old);
    }
}
