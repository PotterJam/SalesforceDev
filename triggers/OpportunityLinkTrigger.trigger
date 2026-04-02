trigger OpportunityLinkTrigger on Opportunity_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityLinkHandler.handleAfterDelete(Trigger.old);
    }
}
