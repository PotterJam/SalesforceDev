trigger VendorDeltaTrigger on Vendor_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
