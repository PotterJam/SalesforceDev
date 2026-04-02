trigger DashboardStreamTrigger on Dashboard_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardStreamHandler.handleAfterDelete(Trigger.old);
    }
}
