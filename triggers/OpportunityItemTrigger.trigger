trigger OpportunityItemTrigger on Opportunity_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityItemHandler.handleAfterDelete(Trigger.old);
    }
}
