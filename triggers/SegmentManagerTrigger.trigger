trigger SegmentManagerTrigger on Segment_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentManagerHandler.handleAfterDelete(Trigger.old);
    }
}
