trigger BudgetAuditTrigger on Budget_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetAuditHandler.handleAfterDelete(Trigger.old);
    }
}
