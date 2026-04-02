trigger RiskBridgeTrigger on Risk_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
