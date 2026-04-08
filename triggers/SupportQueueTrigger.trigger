trigger SupportQueueTrigger on Support_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportQueueHandler.handleAfterDelete(Trigger.old);
    }
}
