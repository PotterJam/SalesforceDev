trigger ActualPlanTrigger on Actual_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualPlanHandler.handleAfterDelete(Trigger.old);
    }
}
