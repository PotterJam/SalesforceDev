trigger OpportunityResponseTrigger on Opportunity_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityResponseHandler.handleAfterDelete(Trigger.old);
    }
}
