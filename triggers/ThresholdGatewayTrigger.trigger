trigger ThresholdGatewayTrigger on Threshold_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
