trigger OpportunityEntryTrigger on Opportunity_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityEntryHandler.handleAfterDelete(Trigger.old);
    }
}
