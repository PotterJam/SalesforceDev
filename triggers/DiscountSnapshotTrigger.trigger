trigger DiscountSnapshotTrigger on Discount_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
