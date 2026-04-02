trigger DependencyTemplateTrigger on Dependency_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
