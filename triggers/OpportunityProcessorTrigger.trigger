trigger OpportunityProcessorTrigger on Opportunity_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
