trigger MetricConfigTrigger on Metric_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricConfigHandler.handleAfterDelete(Trigger.old);
    }
}
