trigger ApprovalActionTrigger on Approval_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalActionHandler.handleAfterDelete(Trigger.old);
    }
}
