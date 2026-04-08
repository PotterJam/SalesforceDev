trigger CeilingTemplateTrigger on Ceiling_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
