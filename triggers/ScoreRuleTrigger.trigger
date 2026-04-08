trigger ScoreRuleTrigger on Score_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRuleHandler.handleAfterDelete(Trigger.old);
    }
}
