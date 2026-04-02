trigger IssueRuleTrigger on Issue_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRuleHandler.handleAfterDelete(Trigger.old);
    }
}
