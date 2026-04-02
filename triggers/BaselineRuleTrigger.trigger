trigger BaselineRuleTrigger on Baseline_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineRuleHandler.handleAfterDelete(Trigger.old);
    }
}
