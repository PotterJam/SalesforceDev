trigger BudgetCacheTrigger on Budget_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetCacheHandler.handleAfterDelete(Trigger.old);
    }
}
