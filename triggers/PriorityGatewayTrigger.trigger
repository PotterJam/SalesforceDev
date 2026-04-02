trigger PriorityGatewayTrigger on Priority_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
