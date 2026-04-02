trigger BudgetHandlerTrigger on Budget_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
