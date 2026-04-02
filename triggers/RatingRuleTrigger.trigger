trigger RatingRuleTrigger on Rating_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingRuleHandler.handleAfterDelete(Trigger.old);
    }
}
