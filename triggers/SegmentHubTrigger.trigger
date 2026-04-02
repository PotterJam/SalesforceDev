trigger SegmentHubTrigger on Segment_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentHubHandler.handleAfterDelete(Trigger.old);
    }
}
