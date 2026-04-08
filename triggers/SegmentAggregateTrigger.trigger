trigger SegmentAggregateTrigger on Segment_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
