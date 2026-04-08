trigger CustomerRuleTrigger on Customer_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRuleHandler.handleAfterDelete(Trigger.old);
    }
}
