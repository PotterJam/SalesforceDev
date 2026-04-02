trigger ApprovalLogTrigger on Approval_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalLogHandler.handleAfterDelete(Trigger.old);
    }
}
