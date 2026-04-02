trigger BaselineQueueTrigger on Baseline_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineQueueHandler.handleAfterDelete(Trigger.old);
    }
}
