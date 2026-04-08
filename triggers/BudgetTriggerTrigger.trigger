trigger BudgetTriggerTrigger on Budget_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
