trigger BudgetBatchTrigger on Budget_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetBatchHandler.handleAfterDelete(Trigger.old);
    }
}
