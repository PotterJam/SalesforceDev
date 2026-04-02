trigger ResearchTemplateTrigger on Research_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
