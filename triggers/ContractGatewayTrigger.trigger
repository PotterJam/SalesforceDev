trigger ContractGatewayTrigger on Contract_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
