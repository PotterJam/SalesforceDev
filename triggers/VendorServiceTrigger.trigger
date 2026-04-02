trigger VendorServiceTrigger on Vendor_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorServiceHandler.handleAfterDelete(Trigger.old);
    }
}
