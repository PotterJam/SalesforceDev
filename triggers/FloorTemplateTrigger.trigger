trigger FloorTemplateTrigger on Floor_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
