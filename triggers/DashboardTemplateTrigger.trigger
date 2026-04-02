trigger DashboardTemplateTrigger on Dashboard_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
