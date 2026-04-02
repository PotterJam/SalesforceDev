trigger QualityBridgeTrigger on Quality_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
