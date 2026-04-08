trigger ProductRuleTrigger on Product_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductRuleHandler.handleAfterDelete(Trigger.old);
    }
}
