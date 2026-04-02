trigger DashboardTaskTrigger on Dashboard_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTaskHandler.handleAfterDelete(Trigger.old);
    }
}
