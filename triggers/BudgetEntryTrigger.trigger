trigger BudgetEntryTrigger on Budget_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetEntryHandler.handleAfterDelete(Trigger.old);
    }
}
