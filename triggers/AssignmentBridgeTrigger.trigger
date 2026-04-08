trigger AssignmentBridgeTrigger on Assignment_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
