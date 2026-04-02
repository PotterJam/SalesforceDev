trigger AnalyticsTemplateTrigger on Analytics_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
