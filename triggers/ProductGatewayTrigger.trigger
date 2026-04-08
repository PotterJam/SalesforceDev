trigger ProductGatewayTrigger on Product_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
