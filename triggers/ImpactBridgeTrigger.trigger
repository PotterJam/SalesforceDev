trigger ImpactBridgeTrigger on Impact_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
