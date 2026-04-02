trigger VendorModuleTrigger on Vendor_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorModuleHandler.handleAfterDelete(Trigger.old);
    }
}
