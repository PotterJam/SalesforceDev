trigger MetricModelTrigger on Metric_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricModelHandler.handleAfterDelete(Trigger.old);
    }
}
