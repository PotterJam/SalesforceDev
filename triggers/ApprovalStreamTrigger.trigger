trigger ApprovalStreamTrigger on Approval_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalStreamHandler.handleAfterDelete(Trigger.old);
    }
}
