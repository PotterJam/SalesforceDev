trigger IssueProcessorTrigger on Issue_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
