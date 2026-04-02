trigger ResolutionGatewayTrigger on Resolution_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
