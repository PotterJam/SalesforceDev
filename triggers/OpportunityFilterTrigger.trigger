trigger OpportunityFilterTrigger on Opportunity_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityFilterHandler.handleAfterDelete(Trigger.old);
    }
}
