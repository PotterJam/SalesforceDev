trigger IssueTransactionTrigger on Issue_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
