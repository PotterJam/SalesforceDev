trigger SegmentPlanTrigger on Segment_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentPlanHandler.handleAfterDelete(Trigger.old);
    }
}
