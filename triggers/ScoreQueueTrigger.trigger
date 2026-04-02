trigger ScoreQueueTrigger on Score_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreQueueHandler.handleAfterDelete(Trigger.old);
    }
}
