trigger SegmentLogTrigger on Segment_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentLogHandler.handleAfterDelete(Trigger.old);
    }
}
