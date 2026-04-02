trigger TagTemplateTrigger on Tag_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
