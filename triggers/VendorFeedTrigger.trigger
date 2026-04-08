trigger VendorFeedTrigger on Vendor_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorFeedHandler.handleAfterDelete(Trigger.old);
    }
}
