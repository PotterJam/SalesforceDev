trigger ApprovalBridgeTrigger on Approval_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
