trigger OpportunityRequestTrigger on Opportunity_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRequestHandler.handleAfterDelete(Trigger.old);
    }
}
