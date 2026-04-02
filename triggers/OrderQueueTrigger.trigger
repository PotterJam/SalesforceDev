trigger OrderQueueTrigger on Order_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderQueueHandler.handleAfterDelete(Trigger.old);
    }
}
