trigger OpportunityPlanTrigger on Opportunity_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPlanHandler.handleAfterDelete(Trigger.old);
    }
}
