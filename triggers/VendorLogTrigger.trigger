trigger VendorLogTrigger on Vendor_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorLogHandler.handleAfterDelete(Trigger.old);
    }
}
