trigger LeadRuleTrigger on Lead_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadRuleHandler.handleAfterDelete(Trigger.old);
    }
}
