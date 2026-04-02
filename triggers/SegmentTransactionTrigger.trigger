trigger SegmentTransactionTrigger on Segment_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
