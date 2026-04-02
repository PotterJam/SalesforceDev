trigger OrderTemplateTrigger on Order_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
