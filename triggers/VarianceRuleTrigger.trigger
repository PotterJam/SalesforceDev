trigger VarianceRuleTrigger on Variance_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceRuleHandler.handleAfterDelete(Trigger.old);
    }
}
