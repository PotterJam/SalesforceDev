trigger VendorHookTrigger on Vendor_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorHookHandler.handleAfterDelete(Trigger.old);
    }
}
