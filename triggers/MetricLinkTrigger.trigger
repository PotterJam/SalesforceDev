trigger MetricLinkTrigger on Metric_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricLinkHandler.handleAfterDelete(Trigger.old);
    }
}
