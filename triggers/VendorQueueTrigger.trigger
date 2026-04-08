trigger VendorQueueTrigger on Vendor_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorQueueHandler.handleAfterDelete(Trigger.old);
    }
}
