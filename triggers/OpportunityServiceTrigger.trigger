trigger OpportunityServiceTrigger on Opportunity_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityServiceHandler.handleAfterDelete(Trigger.old);
    }
}
