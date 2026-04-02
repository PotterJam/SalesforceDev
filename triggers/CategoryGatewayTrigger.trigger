trigger CategoryGatewayTrigger on Category_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
