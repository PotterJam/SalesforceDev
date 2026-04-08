trigger OpportunityProcessTrigger on Opportunity_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityProcessHandler.handleAfterDelete(Trigger.old);
    }
}
