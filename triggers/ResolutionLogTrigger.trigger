trigger ResolutionLogTrigger on Resolution_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionLogHandler.handleAfterDelete(Trigger.old);
    }
}
