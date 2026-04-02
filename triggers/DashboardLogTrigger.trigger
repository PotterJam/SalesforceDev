trigger DashboardLogTrigger on Dashboard_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardLogHandler.handleAfterDelete(Trigger.old);
    }
}
