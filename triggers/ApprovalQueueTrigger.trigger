trigger ApprovalQueueTrigger on Approval_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalQueueHandler.handleAfterDelete(Trigger.old);
    }
}
