trigger AllocationBridgeTrigger on Allocation_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
