trigger SegmentFeedTrigger on Segment_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentFeedHandler.handleAfterDelete(Trigger.old);
    }
}
