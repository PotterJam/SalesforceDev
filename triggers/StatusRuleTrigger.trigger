trigger StatusRuleTrigger on Status_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRuleHandler.handleAfterDelete(Trigger.old);
    }
}
