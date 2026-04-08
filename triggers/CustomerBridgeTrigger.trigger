trigger CustomerBridgeTrigger on Customer_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
