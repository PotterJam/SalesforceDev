trigger SegmentPreferenceTrigger on Segment_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SegmentPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SegmentPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SegmentPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SegmentPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
