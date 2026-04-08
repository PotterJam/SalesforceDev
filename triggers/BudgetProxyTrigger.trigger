trigger BudgetProxyTrigger on Budget_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetProxyHandler.handleAfterDelete(Trigger.old);
    }
}
