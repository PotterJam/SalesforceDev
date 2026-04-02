trigger RiskGatewayTrigger on Risk_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
