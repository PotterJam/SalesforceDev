trigger IssueServiceTrigger on Issue_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueServiceHandler.handleAfterDelete(Trigger.old);
    }
}
