trigger VendorBridgeTrigger on Vendor_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
