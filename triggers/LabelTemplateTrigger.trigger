trigger LabelTemplateTrigger on Label_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
