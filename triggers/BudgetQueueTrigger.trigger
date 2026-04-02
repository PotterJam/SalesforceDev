trigger BudgetQueueTrigger on Budget_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetQueueHandler.handleAfterDelete(Trigger.old);
    }
}
