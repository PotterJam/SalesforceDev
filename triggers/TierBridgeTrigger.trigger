trigger TierBridgeTrigger on Tier_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
