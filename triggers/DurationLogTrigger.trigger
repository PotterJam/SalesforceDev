trigger DurationLogTrigger on Duration_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationLogHandler.handleAfterDelete(Trigger.old);
    }
}
