trigger ApprovalNodeTrigger on Approval_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalNodeHandler.handleAfterDelete(Trigger.old);
    }
}
