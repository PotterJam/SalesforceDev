trigger MetricCatalogTrigger on Metric_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
