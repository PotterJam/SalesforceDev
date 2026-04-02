trigger AnalyticsModelTrigger on Analytics_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsModelHandler.handleAfterDelete(Trigger.old);
    }
}
