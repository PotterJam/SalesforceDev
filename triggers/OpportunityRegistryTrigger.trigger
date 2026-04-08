trigger OpportunityRegistryTrigger on Opportunity_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
