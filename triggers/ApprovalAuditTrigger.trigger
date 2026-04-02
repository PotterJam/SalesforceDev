trigger ApprovalAuditTrigger on Approval_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalAuditHandler.handleAfterDelete(Trigger.old);
    }
}
