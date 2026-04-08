trigger TrainingRuleTrigger on Training_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRuleHandler.handleAfterDelete(Trigger.old);
    }
}
