trigger ProductTemplateTrigger on Product_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
