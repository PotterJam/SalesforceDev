trigger CapacityBridgeTrigger on Capacity_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
