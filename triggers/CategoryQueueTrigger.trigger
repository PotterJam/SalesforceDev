trigger CategoryQueueTrigger on Category_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryQueueHandler.handleAfterDelete(Trigger.old);
    }
}
