trigger OpportunityStageTrigger on Opportunity_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityStageHandler.handleAfterDelete(Trigger.old);
    }
}
