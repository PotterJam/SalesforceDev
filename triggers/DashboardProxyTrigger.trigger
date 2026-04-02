trigger DashboardProxyTrigger on Dashboard_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardProxyHandler.handleAfterDelete(Trigger.old);
    }
}
