trigger ActualLogTrigger on Actual_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualLogHandler.handleAfterDelete(Trigger.old);
    }
}
