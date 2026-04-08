trigger OpportunityTemplateTrigger on Opportunity_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
