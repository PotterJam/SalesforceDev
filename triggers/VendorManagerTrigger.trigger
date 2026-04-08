trigger VendorManagerTrigger on Vendor_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorManagerHandler.handleAfterDelete(Trigger.old);
    }
}
