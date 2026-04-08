trigger BaselineTrackerTrigger on Baseline_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
