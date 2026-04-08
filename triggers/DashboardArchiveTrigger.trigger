trigger DashboardArchiveTrigger on Dashboard_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
