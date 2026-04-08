trigger OrderGatewayTrigger on Order_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
