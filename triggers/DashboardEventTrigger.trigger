trigger DashboardEventTrigger on Dashboard_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardEventHandler.handleAfterDelete(Trigger.old);
    }
}
