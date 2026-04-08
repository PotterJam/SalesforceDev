trigger OpportunityDeltaTrigger on Opportunity_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
