trigger VendorStoreTrigger on Vendor_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorStoreHandler.handleAfterDelete(Trigger.old);
    }
}
