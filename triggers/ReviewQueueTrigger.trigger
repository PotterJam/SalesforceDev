trigger ReviewQueueTrigger on Review_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewQueueHandler.handleAfterDelete(Trigger.old);
    }
}
