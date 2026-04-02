trigger MetricSchemaTrigger on Metric_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
