trigger VendorSnapshotTrigger on Vendor_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VendorSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VendorSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VendorSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VendorSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VendorSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
