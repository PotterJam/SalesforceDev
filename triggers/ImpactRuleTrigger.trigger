trigger ImpactRuleTrigger on Impact_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactRuleHandler.handleAfterDelete(Trigger.old);
    }
}
