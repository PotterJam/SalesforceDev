trigger BillingSnapshotTrigger on Billing_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
