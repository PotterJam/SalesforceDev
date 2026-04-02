trigger ThresholdTrackerTrigger on Threshold_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
