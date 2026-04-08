trigger MetricHandlerTrigger on Metric_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
