trigger DependencyRuleTrigger on Dependency_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRuleHandler.handleAfterDelete(Trigger.old);
    }
}
