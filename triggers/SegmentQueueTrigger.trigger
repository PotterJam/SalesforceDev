trigger SegmentQueueTrigger on Segment_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentQueueHandler.handleAfterDelete(Trigger.old);
    }
}
