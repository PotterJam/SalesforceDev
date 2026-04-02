trigger ApprovalGatewayTrigger on Approval_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
