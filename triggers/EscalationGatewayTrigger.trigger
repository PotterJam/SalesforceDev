trigger EscalationGatewayTrigger on Escalation_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
