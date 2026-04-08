trigger IndexQueueTrigger on Index_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexQueueHandler.handleAfterDelete(Trigger.old);
    }
}
