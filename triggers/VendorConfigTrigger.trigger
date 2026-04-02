trigger VendorConfigTrigger on Vendor_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorConfigHandler.handleAfterDelete(Trigger.old);
    }
}
