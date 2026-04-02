trigger SegmentBridgeTrigger on Segment_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
