trigger DashboardRelayTrigger on Dashboard_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardRelayHandler.handleAfterDelete(Trigger.old);
    }
}
