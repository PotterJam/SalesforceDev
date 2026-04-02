trigger OpportunityGatewayTrigger on Opportunity_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
