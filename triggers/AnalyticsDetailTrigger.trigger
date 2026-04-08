trigger AnalyticsDetailTrigger on Analytics_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsDetailHandler.handleAfterDelete(Trigger.old);
    }
}
