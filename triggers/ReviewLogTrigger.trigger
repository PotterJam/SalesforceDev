trigger ReviewLogTrigger on Review_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewLogHandler.handleAfterDelete(Trigger.old);
    }
}
