trigger VendorRelayTrigger on Vendor_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorRelayHandler.handleAfterDelete(Trigger.old);
    }
}
