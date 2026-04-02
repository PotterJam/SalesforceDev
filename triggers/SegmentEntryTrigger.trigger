trigger SegmentEntryTrigger on Segment_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentEntryHandler.handleAfterDelete(Trigger.old);
    }
}
