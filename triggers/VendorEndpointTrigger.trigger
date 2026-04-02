trigger VendorEndpointTrigger on Vendor_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
