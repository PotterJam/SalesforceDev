trigger DurationBridgeTrigger on Duration_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
