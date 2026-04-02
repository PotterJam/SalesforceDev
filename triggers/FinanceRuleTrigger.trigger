trigger FinanceRuleTrigger on Finance_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceRuleHandler.handleAfterDelete(Trigger.old);
    }
}
