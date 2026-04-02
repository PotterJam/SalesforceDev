trigger PriorityTrackerTrigger on Priority_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
