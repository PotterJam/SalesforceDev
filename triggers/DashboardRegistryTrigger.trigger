trigger DashboardRegistryTrigger on Dashboard_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
