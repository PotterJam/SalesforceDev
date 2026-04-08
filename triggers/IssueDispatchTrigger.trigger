trigger IssueDispatchTrigger on Issue_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
