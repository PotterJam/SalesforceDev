trigger BudgetDetailTrigger on Budget_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetDetailHandler.handleAfterDelete(Trigger.old);
    }
}
