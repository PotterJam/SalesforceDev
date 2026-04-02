trigger BudgetRequestTrigger on Budget_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRequestHandler.handleAfterDelete(Trigger.old);
    }
}
