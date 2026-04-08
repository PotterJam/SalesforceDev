trigger ThresholdConnectorTrigger on Threshold_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
