trigger FloorBridgeTrigger on Floor_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
