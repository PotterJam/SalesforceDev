trigger TagGatewayTrigger on Tag_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
