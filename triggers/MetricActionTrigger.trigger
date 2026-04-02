trigger MetricActionTrigger on Metric_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricActionHandler.handleAfterDelete(Trigger.old);
    }
}
