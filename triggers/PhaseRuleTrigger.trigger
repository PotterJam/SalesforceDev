trigger PhaseRuleTrigger on Phase_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseRuleHandler.handleAfterDelete(Trigger.old);
    }
}
