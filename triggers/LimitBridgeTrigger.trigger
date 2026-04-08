trigger LimitBridgeTrigger on Limit_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
