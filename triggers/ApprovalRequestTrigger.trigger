trigger ApprovalRequestTrigger on Approval_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRequestHandler.handleAfterDelete(Trigger.old);
    }
}
