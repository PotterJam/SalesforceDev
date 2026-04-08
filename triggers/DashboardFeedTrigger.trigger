trigger DashboardFeedTrigger on Dashboard_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardFeedHandler.handleAfterDelete(Trigger.old);
    }
}
