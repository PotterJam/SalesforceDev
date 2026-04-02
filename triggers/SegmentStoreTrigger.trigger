trigger SegmentStoreTrigger on Segment_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentStoreHandler.handleAfterDelete(Trigger.old);
    }
}
