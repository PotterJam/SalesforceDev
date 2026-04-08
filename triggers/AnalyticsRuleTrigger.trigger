trigger AnalyticsRuleTrigger on Analytics_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsRuleHandler.handleAfterDelete(Trigger.old);
    }
}
