trigger OpportunityRouteTrigger on Opportunity_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRouteHandler.handleAfterDelete(Trigger.old);
    }
}
