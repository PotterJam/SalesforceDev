trigger PaymentTemplateTrigger on Payment_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
