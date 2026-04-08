trigger SegmentFlowTrigger on Segment_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentFlowHandler.handleAfterDelete(Trigger.old);
    }
}
