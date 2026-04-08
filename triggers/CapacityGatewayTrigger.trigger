trigger CapacityGatewayTrigger on Capacity_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
