trigger CapacityQueueTrigger on Capacity_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityQueueHandler.handleAfterDelete(Trigger.old);
    }
}
