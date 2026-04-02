trigger OpportunityFeedTrigger on Opportunity_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityFeedHandler.handleAfterDelete(Trigger.old);
    }
}
