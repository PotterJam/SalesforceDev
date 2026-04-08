trigger OpportunityBatchTrigger on Opportunity_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityBatchHandler.handleAfterDelete(Trigger.old);
    }
}
