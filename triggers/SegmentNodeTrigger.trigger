trigger SegmentNodeTrigger on Segment_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentNodeHandler.handleAfterDelete(Trigger.old);
    }
}
