trigger IssueLogTrigger on Issue_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueLogHandler.handleAfterDelete(Trigger.old);
    }
}
