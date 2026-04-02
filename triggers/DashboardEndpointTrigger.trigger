trigger DashboardEndpointTrigger on Dashboard_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
