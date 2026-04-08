trigger VendorProcessTrigger on Vendor_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorProcessHandler.handleAfterDelete(Trigger.old);
    }
}
