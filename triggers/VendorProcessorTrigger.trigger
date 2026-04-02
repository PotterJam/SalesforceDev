trigger VendorProcessorTrigger on Vendor_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
