trigger SegmentModelTrigger on Segment_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentModelHandler.handleAfterDelete(Trigger.old);
    }
}
