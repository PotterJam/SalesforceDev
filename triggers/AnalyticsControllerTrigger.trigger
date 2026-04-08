trigger AnalyticsControllerTrigger on Analytics_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsControllerHandler.handleAfterDelete(Trigger.old);
    }
}
