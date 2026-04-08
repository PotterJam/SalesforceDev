trigger TerritoryBridgeTrigger on Territory_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
