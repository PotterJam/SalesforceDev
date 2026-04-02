trigger VendorEntryTrigger on Vendor_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorEntryHandler.handleAfterDelete(Trigger.old);
    }
}
