trigger SegmentConfigTrigger on Segment_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentConfigHandler.handleAfterDelete(Trigger.old);
    }
}
