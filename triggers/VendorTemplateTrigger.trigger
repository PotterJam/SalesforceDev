trigger VendorTemplateTrigger on Vendor_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
