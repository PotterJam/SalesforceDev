trigger OpportunityViewTrigger on Opportunity_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityViewHandler.handleAfterDelete(Trigger.old);
    }
}
