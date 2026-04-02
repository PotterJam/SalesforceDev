trigger IssueHandlerTrigger on Issue_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
