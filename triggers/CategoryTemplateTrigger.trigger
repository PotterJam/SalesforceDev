trigger CategoryTemplateTrigger on Category_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
