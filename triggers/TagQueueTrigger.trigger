trigger TagQueueTrigger on Tag_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagQueueHandler.handleAfterDelete(Trigger.old);
    }
}
