trigger BudgetTransactionTrigger on Budget_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
