trigger DashboardRuleTrigger on Dashboard_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRuleHandler.handleAfterDelete(Trigger.old);
    }
}
