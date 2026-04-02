trigger PaymentRuleTrigger on Payment_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentRuleHandler.handleAfterDelete(Trigger.old);
    }
}
