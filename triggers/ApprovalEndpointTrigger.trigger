trigger ApprovalEndpointTrigger on Approval_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
