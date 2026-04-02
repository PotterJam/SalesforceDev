trigger ScoreTemplateTrigger on Score_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
