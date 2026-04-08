trigger ThresholdEndpointTrigger on Threshold_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
