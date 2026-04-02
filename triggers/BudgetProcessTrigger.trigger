trigger BudgetProcessTrigger on Budget_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetProcessHandler.handleAfterDelete(Trigger.old);
    }
}
