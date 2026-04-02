trigger TrainingTemplateTrigger on Training_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
