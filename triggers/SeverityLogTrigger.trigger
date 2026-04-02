trigger SeverityLogTrigger on Severity_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityLogHandler.handleAfterDelete(Trigger.old);
    }
}
