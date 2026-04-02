trigger ReviewTemplateTrigger on Review_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
