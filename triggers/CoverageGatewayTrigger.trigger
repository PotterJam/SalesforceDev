trigger CoverageGatewayTrigger on Coverage_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
