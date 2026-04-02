trigger IssueQueueTrigger on Issue_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueQueueHandler.handleAfterDelete(Trigger.old);
    }
}
