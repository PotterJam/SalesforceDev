trigger IndexRuleTrigger on Index_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexRuleHandler.handleAfterDelete(Trigger.old);
    }
}
