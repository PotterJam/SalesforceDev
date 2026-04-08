trigger OpportunityHookTrigger on Opportunity_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityHookHandler.handleAfterDelete(Trigger.old);
    }
}
