trigger VendorTriggerTrigger on Vendor_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
