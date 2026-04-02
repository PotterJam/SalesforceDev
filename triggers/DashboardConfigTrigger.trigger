trigger DashboardConfigTrigger on Dashboard_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardConfigHandler.handleAfterDelete(Trigger.old);
    }
}
