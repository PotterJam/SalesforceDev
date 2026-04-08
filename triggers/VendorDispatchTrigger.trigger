trigger VendorDispatchTrigger on Vendor_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
