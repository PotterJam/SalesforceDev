trigger BudgetPolicyTrigger on Budget_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
