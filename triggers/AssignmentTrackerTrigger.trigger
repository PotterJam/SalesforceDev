trigger AssignmentTrackerTrigger on Assignment_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
