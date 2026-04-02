trigger IssueResponseTrigger on Issue_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueResponseHandler.handleAfterDelete(Trigger.old);
    }
}
