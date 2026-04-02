trigger DashboardConnectorTrigger on Dashboard_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
