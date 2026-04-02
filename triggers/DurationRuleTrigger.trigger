trigger DurationRuleTrigger on Duration_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationRuleHandler.handleAfterDelete(Trigger.old);
    }
}
