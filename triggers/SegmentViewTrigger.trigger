trigger SegmentViewTrigger on Segment_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentViewHandler.handleAfterDelete(Trigger.old);
    }
}
