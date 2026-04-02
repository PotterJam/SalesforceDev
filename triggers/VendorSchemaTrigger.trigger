trigger VendorSchemaTrigger on Vendor_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
