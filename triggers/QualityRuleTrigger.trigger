trigger QualityRuleTrigger on Quality_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityRuleHandler.handleAfterDelete(Trigger.old);
    }
}
