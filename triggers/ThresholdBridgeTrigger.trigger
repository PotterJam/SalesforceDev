trigger ThresholdBridgeTrigger on Threshold_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
