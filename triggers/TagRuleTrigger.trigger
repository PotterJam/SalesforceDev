trigger TagRuleTrigger on Tag_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRuleHandler.handleAfterDelete(Trigger.old);
    }
}
