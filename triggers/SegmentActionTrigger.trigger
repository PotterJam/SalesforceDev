trigger SegmentActionTrigger on Segment_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentActionHandler.handleAfterDelete(Trigger.old);
    }
}
