trigger PhaseTemplateTrigger on Phase_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
