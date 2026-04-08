trigger ResolutionRuleTrigger on Resolution_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionRuleHandler.handleAfterDelete(Trigger.old);
    }
}
