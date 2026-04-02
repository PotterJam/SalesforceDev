trigger AnalyticsJobTrigger on Analytics_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsJobHandler.handleAfterDelete(Trigger.old);
    }
}
