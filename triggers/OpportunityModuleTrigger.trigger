trigger OpportunityModuleTrigger on Opportunity_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityModuleHandler.handleAfterDelete(Trigger.old);
    }
}
