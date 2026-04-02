trigger PriorityQueueTrigger on Priority_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityQueueHandler.handleAfterDelete(Trigger.old);
    }
}
