trigger BudgetEventTrigger on Budget_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetEventHandler.handleAfterDelete(Trigger.old);
    }
}
