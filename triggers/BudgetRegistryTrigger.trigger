trigger BudgetRegistryTrigger on Budget_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
