trigger DashboardDeltaTrigger on Dashboard_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
