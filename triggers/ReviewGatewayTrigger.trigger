trigger ReviewGatewayTrigger on Review_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
