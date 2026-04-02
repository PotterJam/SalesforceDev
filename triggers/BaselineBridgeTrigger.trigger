trigger BaselineBridgeTrigger on Baseline_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
