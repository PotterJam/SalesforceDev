trigger VendorGatewayTrigger on Vendor_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
