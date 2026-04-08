trigger VendorAggregateTrigger on Vendor_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
