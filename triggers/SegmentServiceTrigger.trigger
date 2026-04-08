trigger SegmentServiceTrigger on Segment_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentServiceHandler.handleAfterDelete(Trigger.old);
    }
}
