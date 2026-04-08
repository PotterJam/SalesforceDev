trigger DashboardCacheTrigger on Dashboard_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardCacheHandler.handleAfterDelete(Trigger.old);
    }
}
