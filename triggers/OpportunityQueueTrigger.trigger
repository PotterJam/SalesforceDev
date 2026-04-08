trigger OpportunityQueueTrigger on Opportunity_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityQueueHandler.handleAfterDelete(Trigger.old);
    }
}
