trigger MetricBindingTrigger on Metric_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricBindingHandler.handleAfterDelete(Trigger.old);
    }
}
