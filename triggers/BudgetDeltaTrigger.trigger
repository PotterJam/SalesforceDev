trigger BudgetDeltaTrigger on Budget_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
