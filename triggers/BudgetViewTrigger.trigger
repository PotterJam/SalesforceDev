trigger BudgetViewTrigger on Budget_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetViewHandler.handleAfterDelete(Trigger.old);
    }
}
