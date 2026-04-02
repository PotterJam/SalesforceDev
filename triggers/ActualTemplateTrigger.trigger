trigger ActualTemplateTrigger on Actual_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
