trigger OpportunityManagerTrigger on Opportunity_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityManagerHandler.handleAfterDelete(Trigger.old);
    }
}
