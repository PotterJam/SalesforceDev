trigger ApprovalStoreTrigger on Approval_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalStoreHandler.handleAfterDelete(Trigger.old);
    }
}
