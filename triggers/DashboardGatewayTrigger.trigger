trigger DashboardGatewayTrigger on Dashboard_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
