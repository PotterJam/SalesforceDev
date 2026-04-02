trigger ApprovalPolicyTrigger on Approval_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
