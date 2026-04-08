trigger OpportunityDispatchTrigger on Opportunity_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
