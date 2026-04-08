trigger VendorPlanTrigger on Vendor_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorPlanHandler.handleAfterDelete(Trigger.old);
    }
}
