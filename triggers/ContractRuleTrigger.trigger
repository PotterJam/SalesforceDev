trigger ContractRuleTrigger on Contract_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractRuleHandler.handleAfterDelete(Trigger.old);
    }
}
