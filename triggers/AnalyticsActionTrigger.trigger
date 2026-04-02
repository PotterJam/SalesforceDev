trigger AnalyticsActionTrigger on Analytics_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsActionHandler.handleAfterDelete(Trigger.old);
    }
}
