trigger VendorRegistryTrigger on Vendor_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
