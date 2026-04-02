trigger DashboardModuleTrigger on Dashboard_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardModuleHandler.handleAfterDelete(Trigger.old);
    }
}
