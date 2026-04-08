trigger LimitGatewayTrigger on Limit_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
