trigger SalesRuleTrigger on Sales_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRuleHandler.handleAfterDelete(Trigger.old);
    }
}
