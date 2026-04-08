trigger OpportunityMappingTrigger on Opportunity_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityMappingHandler.handleAfterDelete(Trigger.old);
    }
}
