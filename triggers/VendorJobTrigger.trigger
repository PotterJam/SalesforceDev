trigger VendorJobTrigger on Vendor_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorJobHandler.handleAfterDelete(Trigger.old);
    }
}
