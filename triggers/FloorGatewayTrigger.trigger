trigger FloorGatewayTrigger on Floor_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
