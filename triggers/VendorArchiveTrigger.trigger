trigger VendorArchiveTrigger on Vendor_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
