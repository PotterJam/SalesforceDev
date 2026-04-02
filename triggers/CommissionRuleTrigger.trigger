trigger CommissionRuleTrigger on Commission_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRuleHandler.handleAfterDelete(Trigger.old);
    }
}
