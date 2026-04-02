trigger VendorSummaryTrigger on Vendor_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
