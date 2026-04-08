trigger VendorRouteTrigger on Vendor_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorRouteHandler.handleAfterDelete(Trigger.old);
    }
}
