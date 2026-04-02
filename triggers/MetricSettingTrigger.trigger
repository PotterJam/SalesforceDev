trigger MetricSettingTrigger on Metric_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricSettingHandler.handleAfterDelete(Trigger.old);
    }
}
