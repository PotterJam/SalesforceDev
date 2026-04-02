trigger OpportunityPolicyTrigger on Opportunity_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
