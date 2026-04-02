trigger LimitRuleTrigger on Limit_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitRuleHandler.handleAfterDelete(Trigger.old);
    }
}
