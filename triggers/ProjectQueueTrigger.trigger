trigger ProjectQueueTrigger on Project_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectQueueHandler.handleAfterDelete(Trigger.old);
    }
}
