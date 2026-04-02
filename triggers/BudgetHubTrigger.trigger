trigger BudgetHubTrigger on Budget_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetHubHandler.handleAfterDelete(Trigger.old);
    }
}
