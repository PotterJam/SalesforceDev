trigger OpportunityHandlerTrigger on Opportunity_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
