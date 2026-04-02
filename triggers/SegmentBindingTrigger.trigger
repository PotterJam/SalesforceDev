trigger SegmentBindingTrigger on Segment_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentBindingHandler.handleAfterDelete(Trigger.old);
    }
}
