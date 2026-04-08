trigger AllocationTrackerTrigger on Allocation_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
