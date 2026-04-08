trigger VendorPreferenceTrigger on Vendor_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
