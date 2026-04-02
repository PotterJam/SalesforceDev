trigger VendorHubTrigger on Vendor_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorHubHandler.handleAfterDelete(Trigger.old);
    }
}
