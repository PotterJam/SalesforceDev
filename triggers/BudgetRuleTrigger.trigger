trigger BudgetRuleTrigger on Budget_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetRuleHandler.handleAfterDelete(Trigger.old);
    }
}
