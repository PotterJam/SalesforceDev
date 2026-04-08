trigger DashboardHubTrigger on Dashboard_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardHubHandler.handleAfterDelete(Trigger.old);
    }
}
