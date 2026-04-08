trigger DashboardBridgeTrigger on Dashboard_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
