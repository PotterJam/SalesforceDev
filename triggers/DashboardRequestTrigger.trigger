trigger DashboardRequestTrigger on Dashboard_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRequestHandler.handleAfterDelete(Trigger.old);
    }
}
