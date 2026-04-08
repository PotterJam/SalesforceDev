trigger MetricDetailTrigger on Metric_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricDetailHandler.handleAfterDelete(Trigger.old);
    }
}
