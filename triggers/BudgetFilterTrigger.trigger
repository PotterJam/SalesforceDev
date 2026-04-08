trigger BudgetFilterTrigger on Budget_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetFilterHandler.handleAfterDelete(Trigger.old);
    }
}
