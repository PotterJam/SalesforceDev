trigger ApprovalRouteTrigger on Approval_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalRouteHandler.handleAfterDelete(Trigger.old);
    }
}
