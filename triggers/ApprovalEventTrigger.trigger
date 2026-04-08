trigger ApprovalEventTrigger on Approval_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalEventHandler.handleAfterDelete(Trigger.old);
    }
}
