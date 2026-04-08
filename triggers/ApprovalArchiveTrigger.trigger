trigger ApprovalArchiveTrigger on Approval_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
