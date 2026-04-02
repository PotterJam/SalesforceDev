trigger LeadTemplateTrigger on Lead_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
