trigger VarianceGatewayTrigger on Variance_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
