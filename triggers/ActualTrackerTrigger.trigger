trigger ActualTrackerTrigger on Actual_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
