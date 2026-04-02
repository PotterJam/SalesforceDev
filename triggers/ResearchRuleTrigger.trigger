trigger ResearchRuleTrigger on Research_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRuleHandler.handleAfterDelete(Trigger.old);
    }
}
