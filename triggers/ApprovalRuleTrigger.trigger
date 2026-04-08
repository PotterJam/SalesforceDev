trigger ApprovalRuleTrigger on Approval_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRuleHandler.handleAfterDelete(Trigger.old);
    }
}
