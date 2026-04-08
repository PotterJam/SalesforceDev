trigger BudgetArchiveTrigger on Budget_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
