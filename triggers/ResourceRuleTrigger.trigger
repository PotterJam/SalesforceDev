trigger ResourceRuleTrigger on Resource_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceRuleHandler.handleAfterDelete(Trigger.old);
    }
}
