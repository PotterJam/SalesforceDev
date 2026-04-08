trigger TargetTemplateTrigger on Target_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
