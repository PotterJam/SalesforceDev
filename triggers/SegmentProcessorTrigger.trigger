trigger SegmentProcessorTrigger on Segment_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
