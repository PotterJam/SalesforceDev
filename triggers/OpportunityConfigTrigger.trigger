trigger OpportunityConfigTrigger on Opportunity_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityConfigHandler.handleAfterDelete(Trigger.old);
    }
}
