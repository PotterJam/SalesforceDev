trigger TargetBridgeTrigger on Target_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
