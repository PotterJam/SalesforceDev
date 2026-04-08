trigger DashboardTrackerTrigger on Dashboard_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
