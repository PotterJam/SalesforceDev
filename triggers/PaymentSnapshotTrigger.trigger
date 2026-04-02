trigger PaymentSnapshotTrigger on Payment_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
