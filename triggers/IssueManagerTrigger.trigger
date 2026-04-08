trigger IssueManagerTrigger on Issue_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueManagerHandler.handleAfterDelete(Trigger.old);
    }
}
