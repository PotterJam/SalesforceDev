trigger ApprovalTransactionTrigger on Approval_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
