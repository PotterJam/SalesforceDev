trigger DashboardEntryTrigger on Dashboard_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardEntryHandler.handleAfterDelete(Trigger.old);
    }
}
