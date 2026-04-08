trigger StatusTrackerTrigger on Status_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
