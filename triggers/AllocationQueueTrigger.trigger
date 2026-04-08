trigger AllocationQueueTrigger on Allocation_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationQueueHandler.handleAfterDelete(Trigger.old);
    }
}
