trigger BudgetFeedTrigger on Budget_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetFeedHandler.handleAfterDelete(Trigger.old);
    }
}
