trigger CapacityTrackerTrigger on Capacity_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
