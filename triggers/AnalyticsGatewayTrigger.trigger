trigger AnalyticsGatewayTrigger on Analytics_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
