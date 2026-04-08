trigger OpportunityTrackerTrigger on Opportunity_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
