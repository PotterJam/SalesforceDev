trigger BudgetStoreTrigger on Budget_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetStoreHandler.handleAfterDelete(Trigger.old);
    }
}
