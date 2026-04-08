trigger BudgetManagerTrigger on Budget_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetManagerHandler.handleAfterDelete(Trigger.old);
    }
}
