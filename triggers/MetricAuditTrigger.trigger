trigger MetricAuditTrigger on Metric_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricAuditHandler.handleAfterDelete(Trigger.old);
    }
}
