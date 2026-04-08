trigger OpportunityTransactionTrigger on Opportunity_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
