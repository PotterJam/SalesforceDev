trigger FrequencyBridgeTrigger on Frequency_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
