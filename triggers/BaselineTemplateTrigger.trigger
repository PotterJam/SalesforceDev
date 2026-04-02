trigger BaselineTemplateTrigger on Baseline_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
