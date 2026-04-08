trigger IssueProcessTrigger on Issue_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueProcessHandler.handleAfterDelete(Trigger.old);
    }
}
