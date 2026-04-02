trigger OpportunityConnectorTrigger on Opportunity_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
