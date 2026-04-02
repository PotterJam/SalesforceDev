trigger OpportunityJobTrigger on Opportunity_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityJobHandler.handleAfterDelete(Trigger.old);
    }
}
