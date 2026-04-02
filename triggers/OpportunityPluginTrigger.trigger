trigger OpportunityPluginTrigger on Opportunity_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityPluginHandler.handleAfterDelete(Trigger.old);
    }
}
