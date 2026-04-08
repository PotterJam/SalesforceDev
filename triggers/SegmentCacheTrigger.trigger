trigger SegmentCacheTrigger on Segment_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentCacheHandler.handleAfterDelete(Trigger.old);
    }
}
