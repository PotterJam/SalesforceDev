trigger VendorNodeTrigger on Vendor_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorNodeHandler.handleAfterDelete(Trigger.old);
    }
}
