trigger RiskRuleTrigger on Risk_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskRuleHandler.handleAfterDelete(Trigger.old);
    }
}
