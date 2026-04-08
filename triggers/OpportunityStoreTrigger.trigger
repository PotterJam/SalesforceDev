trigger OpportunityStoreTrigger on Opportunity_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityStoreHandler.handleAfterDelete(Trigger.old);
    }
}
