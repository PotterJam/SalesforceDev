trigger BudgetHookTrigger on Budget_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetHookHandler.handleAfterDelete(Trigger.old);
    }
}
