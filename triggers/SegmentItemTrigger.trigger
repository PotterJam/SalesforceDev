trigger SegmentItemTrigger on Segment_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentItemHandler.handleAfterDelete(Trigger.old);
    }
}
