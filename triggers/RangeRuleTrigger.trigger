trigger RangeRuleTrigger on Range_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeRuleHandler.handleAfterDelete(Trigger.old);
    }
}
