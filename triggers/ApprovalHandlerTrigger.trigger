trigger ApprovalHandlerTrigger on Approval_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
