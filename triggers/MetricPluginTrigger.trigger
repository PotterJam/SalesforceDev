trigger MetricPluginTrigger on Metric_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricPluginHandler.handleAfterDelete(Trigger.old);
    }
}
