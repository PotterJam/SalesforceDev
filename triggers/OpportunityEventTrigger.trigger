trigger OpportunityEventTrigger on Opportunity_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityEventHandler.handleAfterDelete(Trigger.old);
    }
}
