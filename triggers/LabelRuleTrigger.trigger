trigger LabelRuleTrigger on Label_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelRuleHandler.handleAfterDelete(Trigger.old);
    }
}
