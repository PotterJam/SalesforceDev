trigger MarketingGatewayTrigger on Marketing_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
