trigger TrendGatewayTrigger on Trend_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
