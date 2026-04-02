trigger DashboardAdapterTrigger on Dashboard_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
