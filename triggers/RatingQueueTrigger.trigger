trigger RatingQueueTrigger on Rating_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingQueueHandler.handleAfterDelete(Trigger.old);
    }
}
