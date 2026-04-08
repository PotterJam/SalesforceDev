trigger OpportunityActionTrigger on Opportunity_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityActionHandler.handleAfterDelete(Trigger.old);
    }
}
