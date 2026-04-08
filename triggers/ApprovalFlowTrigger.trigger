trigger ApprovalFlowTrigger on Approval_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalFlowHandler.handleAfterDelete(Trigger.old);
    }
}
