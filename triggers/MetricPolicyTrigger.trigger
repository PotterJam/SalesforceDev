trigger MetricPolicyTrigger on Metric_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
