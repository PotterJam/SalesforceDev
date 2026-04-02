trigger TrendQueueTrigger on Trend_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendQueueHandler.handleAfterDelete(Trigger.old);
    }
}
