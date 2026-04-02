trigger AlertRuleTrigger on Alert_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertRuleHandler.handleAfterDelete(Trigger.old);
    }
}
