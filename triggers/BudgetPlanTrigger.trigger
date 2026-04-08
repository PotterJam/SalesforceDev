trigger BudgetPlanTrigger on Budget_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetPlanHandler.handleAfterDelete(Trigger.old);
    }
}
