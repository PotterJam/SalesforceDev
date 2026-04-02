trigger SegmentTrackerTrigger on Segment_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
