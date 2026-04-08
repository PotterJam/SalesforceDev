trigger AssignmentTemplateTrigger on Assignment_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
