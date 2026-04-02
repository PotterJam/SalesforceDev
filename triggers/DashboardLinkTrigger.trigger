trigger DashboardLinkTrigger on Dashboard_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardLinkHandler.handleAfterDelete(Trigger.old);
    }
}
