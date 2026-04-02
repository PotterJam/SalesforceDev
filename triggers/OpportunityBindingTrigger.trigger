trigger OpportunityBindingTrigger on Opportunity_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityBindingHandler.handleAfterDelete(Trigger.old);
    }
}
