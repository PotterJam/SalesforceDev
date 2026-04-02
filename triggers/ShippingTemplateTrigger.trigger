trigger ShippingTemplateTrigger on Shipping_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
