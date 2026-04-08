trigger VendorAdapterTrigger on Vendor_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
