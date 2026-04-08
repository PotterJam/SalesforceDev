trigger BudgetStageTrigger on Budget_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetStageHandler.handleAfterDelete(Trigger.old);
    }
}
