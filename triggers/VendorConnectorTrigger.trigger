trigger VendorConnectorTrigger on Vendor_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
