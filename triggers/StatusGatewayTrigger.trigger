trigger StatusGatewayTrigger on Status_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
