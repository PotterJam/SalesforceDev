trigger SegmentTaskTrigger on Segment_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentTaskHandler.handleAfterDelete(Trigger.old);
    }
}
