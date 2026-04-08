trigger ActualBridgeTrigger on Actual_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
