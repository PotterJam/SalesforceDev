trigger RatingLogTrigger on Rating_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingLogHandler.handleAfterDelete(Trigger.old);
    }
}
