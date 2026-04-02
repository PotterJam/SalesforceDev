trigger AnalyticsTransformTrigger on Analytics_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsTransformHandler.handleAfterDelete(Trigger.old);
    }
}
