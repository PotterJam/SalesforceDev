trigger IssueStreamTrigger on Issue_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueStreamHandler.handleAfterDelete(Trigger.old);
    }
}
