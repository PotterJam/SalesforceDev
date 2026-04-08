trigger ApprovalTaskTrigger on Approval_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalTaskHandler.handleAfterDelete(Trigger.old);
    }
}
