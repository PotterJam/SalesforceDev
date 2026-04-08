trigger SeverityGatewayTrigger on Severity_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
