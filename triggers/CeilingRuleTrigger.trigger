trigger CeilingRuleTrigger on Ceiling_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingRuleHandler.handleAfterDelete(Trigger.old);
    }
}
