trigger BudgetJobTrigger on Budget_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetJobHandler.handleAfterDelete(Trigger.old);
    }
}
