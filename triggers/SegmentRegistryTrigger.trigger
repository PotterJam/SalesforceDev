trigger SegmentRegistryTrigger on Segment_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
